# Release name and versioning
PRODUCT_RELEASE_NAME := XperiaU-ST25i
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

$(call inherit-product, device/sony/kumquat/full_kumquat.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/products/common_full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ST25i_1261-7885 BUILD_FINGERPRINT=SEMC/ST25i_1261-7885/ST25i:2.3.7/6.0.B.3.184/R7P_zw:user/release-keys PRIVATE_BUILD_DESC="ST25i-user 2.3.7 6.0.B.3.184 R7P_zw test-keys"
PRODUCT_NAME := cyanogen_kumquat
PRODUCT_DEVICE := kumquat

#
# Copy kumquat specific prebuilt files
#
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
