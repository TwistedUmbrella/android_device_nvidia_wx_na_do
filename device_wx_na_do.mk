$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/nvidia/wx_na_do

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/nvidia/shieldtablet/shieldtablet-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/nvidia/wx_na_do/overlay

LOCAL_PATH := device/nvidia/wx_na_do

# Prebuilt Kernel
#ifneq ($(OUT),)
#ifeq ($(MK_KERNEL_OBJ),)
#$(shell rm -rf $(OUT)/obj/KERNEL_OBJ;\
#    mkdir -p $(OUT)/obj;\
#    ln -s $(ANDROID_BUILD_TOP)/$(LOCAL_PATH)/include/KERNEL_OBJ $(OUT)/obj/KERNEL_OBJ)
#MK_KERNEL_OBJ := true
#endif
#endif

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
    fstab.tn8 \
    init.cal.rc \
    init.hdcp.rc \
    init.recovery.tn8.rc \
    init.t124.rc \
    init.tegra.rc \
    init.tegra_emmc.rc \
    init.tlk.rc \
    init.tn8.rc \
    init.tn8.usb.rc \
    power.tn8.rc \
    ueventd.tn8.rc

PRODUCT_PACKAGES += \
    charger \
    charger_res_images

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/touchscreen/rm-wrapper:root/sbin/touchscreen/rm-wrapper \
    $(LOCAL_PATH)/touchscreen/ts.default.so:root/sbin/touchscreen/ts.default.so \
    $(LOCAL_PATH)/touchscreen/librm31080.so:root/sbin/touchscreen/librm31080.so \
    $(LOCAL_PATH)/touchscreen/libc.so:root/sbin/touchscreen/libc.so \
    $(LOCAL_PATH)/touchscreen/libdl.so:root/sbin/touchscreen/libdl.so \
    $(LOCAL_PATH)/touchscreen/liblog.so:root/sbin/touchscreen/liblog.so \
    $(LOCAL_PATH)/touchscreen/libm.so:root/sbin/touchscreen/libm.so \
    $(LOCAL_PATH)/touchscreen/libstdc++.so:root/sbin/touchscreen/libstdc++.so \
    $(LOCAL_PATH)/touchscreen/para_10_0b_00_a0.so:root/sbin/touchscreen/para_10_0b_00_a0.so \
    $(LOCAL_PATH)/touchscreen/rm-runner.sh:root/sbin/touchscreen/rm-runner.sh \
    $(LOCAL_PATH)/touchscreen/linker:root/sbin/touchscreen/linker \
    $(LOCAL_PATH)/touchscreen/para_10_02_00_20.so:root/sbin/touchscreen/para_10_02_00_20.so \
    $(LOCAL_PATH)/touchscreen/para_10_02_00_a0.so:root/sbin/touchscreen/para_10_02_00_a0.so \
    $(LOCAL_PATH)/touchscreen/para_10_02_00_b0.so:root/sbin/touchscreen/para_10_02_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_03_00_20.so:root/sbin/touchscreen/para_10_03_00_20.so \
    $(LOCAL_PATH)/touchscreen/para_10_03_00_a0.so:root/sbin/touchscreen/para_10_03_00_a0.so \
    $(LOCAL_PATH)/touchscreen/para_10_03_00_b0.so:root/sbin/touchscreen/para_10_03_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_04_00_b0.so:root/sbin/touchscreen/para_10_04_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_04_00_c0.so:root/sbin/touchscreen/para_10_04_00_c0.so \
    $(LOCAL_PATH)/touchscreen/para_10_05_00_c0.so:root/sbin/touchscreen/para_10_05_00_c0.so \
    $(LOCAL_PATH)/touchscreen/para_10_06_00_b0.so:root/sbin/touchscreen/para_10_06_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_07_00_b0.so:root/sbin/touchscreen/para_10_07_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_08_00_20.so:root/sbin/touchscreen/para_10_08_00_20.so \
    $(LOCAL_PATH)/touchscreen/para_10_08_00_a0.so:root/sbin/touchscreen/para_10_08_00_a0.so \
    $(LOCAL_PATH)/touchscreen/para_10_08_00_b0.so:root/sbin/touchscreen/para_10_08_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_09_00_c0.so:root/sbin/touchscreen/para_10_09_00_c0.so \
    $(LOCAL_PATH)/touchscreen/para_10_09_01_c0.so:root/sbin/touchscreen/para_10_09_01_c0.so \
    $(LOCAL_PATH)/touchscreen/para_10_09_02_c0.so:root/sbin/touchscreen/para_10_09_02_c0.so \
    $(LOCAL_PATH)/touchscreen/para_10_0a_00_b0.so:root/sbin/touchscreen/para_10_0a_00_b0.so \
    $(LOCAL_PATH)/touchscreen/para_10_0b_00_a0.so:root/sbin/touchscreen/para_10_0b_00_a0.so

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_wx_na_do
PRODUCT_DEVICE := wx_na_do
