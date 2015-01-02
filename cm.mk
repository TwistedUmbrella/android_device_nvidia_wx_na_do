## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := wx_na_do

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/nvidia/wx_na_do/device_wx_na_do.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=wx_na_do \
    TARGET_DEVICE=shieldtablet \
    PRIVATE_BUILD_DESC="wx_na_do-user 5.0.1 LRX22C 29082_493.9700 release-keys" \
    BUILD_FINGERPRINT="nvidia/wx_na_do/shieldtablet:5.0.1/LRX22C/29082_493.9700:user/release-keys" \
    BUILD_DISPLAY_ID="wx_na_do-user 5.0.1 LRX22C 29082_493.9700 release-keys"

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := wx_na_do
PRODUCT_NAME := cm_wx_na_do
PRODUCT_BRAND := nvidia
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_MODEL := SHIELD Tablet
