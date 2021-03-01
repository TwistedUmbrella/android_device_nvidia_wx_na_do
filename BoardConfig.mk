USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/nvidia/wx_na_do/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true

TARGET_BOOTLOADER_BOARD_NAME := ardbeg

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel
TARGET_KERNEL_SOURCE := kernel/nvidia/ardbeg
TARGET_KERNEL_CONFIG := tegra12_philz_defconfig
#TARGET_PREBUILT_KERNEL := device/nvidia/wx_na_do/kernel
BOARD_KERNEL_CMDLINE := "androidboot.selinux=permissive"
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Recovery
TARGET_RECOVERY_INITRC := device/nvidia/wx_na_do/init.rc
TARGET_RECOVERY_FSTAB := device/nvidia/wx_na_do/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/backlight/pwm-backlight/brightness\"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD 
COMMON_GLOBAL_CFLAGS += -DBOARD_HAS_FLIPPED_SCREEN
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/nvidia/wx_na_do/recovery_keys.c
#BOARD_CUSTOM_GRAPHICS := ../../../device/nvidia/wx_na_do/graphics.c

RECOVERY_VARIANT := philz
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200
