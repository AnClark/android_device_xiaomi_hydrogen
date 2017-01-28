#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8956-common
-include device/xiaomi/msm8956-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/hydrogen

# Assert
TARGET_OTA_ASSERT_DEVICE := hydrogen

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26705099776 # 26705116160 - 16384

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_hydrogen_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Tap-to-Wake
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# inherit from the proprietary version
-include vendor/xiaomi/hydrogen/BoardConfigVendor.mk

# ======== ANCLARK MODIFIED AT 2017-1-25 17:52:49 ========
# Tell the build system that this device uses legacy camera HAL.
# Legacy camera HAL is not compatible with CameraServer security feature of Android 7.1.
# [Referred to] Commit: 3ee08625ac865f5670ce1173f84c058f18e59e59 - frameworks-av (git) - Android-x86 - OSDN
# https://osdn.net/projects/android-x86/scm/git/frameworks-av/commits/3ee08625ac865f5670ce1173f84c058f18e59e59
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Disable sdcardfs due to compatibility of some apps (QQ, Wechat, etc.)
TARGET_USE_SDCARDFS := false