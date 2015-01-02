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

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_wx_na_do
PRODUCT_DEVICE := wx_na_do
