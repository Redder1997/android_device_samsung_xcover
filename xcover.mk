#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.


DEVICE_PACKAGE_OVERLAYS := device/samsung/xcover/overlay

PRODUCT_COPY_FILES := \
	device/samsung/xcover/prebuilt/etc/asound.conf:system/etc/asound.conf \
	device/samsung/xcover/prebuilt/etc/vold.fstab:system/etc/vold.fstab 

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/xcover/prebuilt/modules,system/lib/modules)

PRODUCT_COPY_FILES += \
	device/samsung/xcover/prebuilt/init.rc:root/init.rc \
	device/samsung/xcover/prebuilt/init.pxa968.rc:root/init.pxa968.rc \
	device/samsung/xcover/prebuilt/lpm.rc:root/lpm.rc \
	device/samsung/xcover/prebuilt/ueventd.pxa968.rc:root/ueventd.pxa968.rc 

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.debuggable=1 \
	dalvik.vm.dexopt-data-only=1 \
	ro.allow.mock.location=1 \
	persist.service.adb.enable=1 


# update utilities
#PRODUCT_PACKAGES += \
#	bml_over_mtd \
#	setup_fs

# copy the filesystem converter
#PRODUCT_COPY_FILES += \
#	device/samsung/epicmtd/updater.sh:updater.sh

$(call inherit-product-if-exists, vendor/samsung/xcover/xcover-vendor.mk)
