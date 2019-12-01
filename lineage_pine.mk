#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/zte/pine/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := ZTE
PRODUCT_DEVICE := pine
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := ZTE A2020 Pro
PRODUCT_NAME := lineage_pine

# Build info
BUILD_FINGERPRINT := "ZTE/GEN_CN_P855A02/P855A02:9/PKQ1.190821.001/20190927.032426:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=P855A02 \
    PRODUCT_NAME=GEN_CN_P855A02 \
    PRIVATE_BUILD_DESC="msmnile-user 9 PKQ1.190821.001 145 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-zte
