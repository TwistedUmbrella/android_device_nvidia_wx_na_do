#include <unistd.h>
#include <log.h>
#include <trampoline/devices.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mount.h>
#include <pthread.h>
#include <fcntl.h>
#include <linux/watchdog.h>

#define WATCHDOG_INTERVAL 1
#define WATCHDOG_MARGIN 20

#define PID_TOUCH "/touch.pid"
#define PID_WATCHDOG "/watchdog.pid"

static int read_pid(const char* path) {
	int pid;
	FILE *f = fopen(path, "r");
	fscanf(f, "%d", &pid);
	fclose(f);
	ERROR("PID from %s is %d\n", path, pid);
	return pid;
}

static void write_pid(const char* path, int pid) {
	FILE* f = fopen(path, "w");
	int num = fprintf(f, "%d\n", pid);
	fclose(f);
	ERROR("Wrote PID %d (%d chars) to %s\n", pid, num, path);
}

static void kill_pid(const char* path) {
	kill(read_pid(path), SIGKILL);
	unlink(path);
}

static void watchdog_thread() {
	wait_for_file("/dev/watchdog0", 5);
	wait_for_file("/dev/watchdog", 5);
	int fd = open("/dev/watchdog", O_RDWR);

	int timeout = WATCHDOG_INTERVAL + WATCHDOG_MARGIN;
	ioctl(fd, WDIOC_SETTIMEOUT, &timeout);

	ERROR("Watchdog running\n");
	while (1) {
		write(fd, "w", 1);
		sleep(WATCHDOG_INTERVAL);
	}
}

static void ts_thread() {
	symlink("/realdata/media/0/multirom/touchscreen", "/sbin/touchscreen");
	wait_for_file("/dev/touch", 10);
	wait_for_file("/realdata/media/0/multirom", 10);

	ERROR("Starting rm-wrapper...\n");
	char* argv[] = {"/sbin/touchscreen/rm-wrapper", NULL};
	char* envp[] = {"LD_LIBRARY_PATH=/sbin/touchscreen", NULL};
	execve(argv[0], &argv[0], envp);
	ERROR("rm-wrapper is kill\n");
}

int mrom_hook_after_android_mounts(const char *busybox_path, const char *base_path, int type) {
	// only need to kill these if not rebooting
	kill_pid(PID_WATCHDOG);
	kill_pid(PID_TOUCH);

	return 0;
}

void mrom_hook_before_fb_close() {
}

void tramp_hook_before_device_init() {
	signal(SIGCHLD, SIG_IGN);

	if (fork() == 0) {
		ERROR("Forked to %d for touch\n", getpid());
		write_pid(PID_TOUCH, getpid());
		ts_thread();
		_exit(0);
	}

	if (fork() == 0) {
		ERROR("Forked to %d for watchdog\n", getpid());
		write_pid(PID_WATCHDOG, getpid());
		watchdog_thread();
		_exit(0);
	}

	sleep(6); // wait for touchscreen driver to start
	ERROR("UI ready\n");
}
