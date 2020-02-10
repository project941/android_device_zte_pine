# android_device_zte_pine_TWRP(GEN_CN_P855A02)
<font color="#dd0000">Note: Flashing into the phone after compilation will affect WIFI, but MTP mode (file transfer) can be used.</font><br /> 
<font color="#dd0000">Tip: Comment out #Kernel code in BoardConfig.mk and add：</font><br /> 
```
#BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
#NEED_KERNEL_MODULE_SYSTEM := true
#TARGET_KERNEL_ARCH := arm64
#TARGET_KERNEL_CLANG_COMPILE := true
#TARGET_KERNEL_CONFIG := vendor/pine_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
#TARGET_KERNEL_SOURCE := kernel/zte/sm8150
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
```
As a result, WIFI is available and MTP cannot be used.！！！
Build TWRP with minimization：
Sync code.
```
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
```
Build root directory/ Build / make / core / Makefile in the 
```
ifndef BOARD_CUSTOM_BOOTIMG_MK
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
		@echo ----- Making recovery image ------
		$(call build-recoveryimage-target, $@)
endif # BOARD_CUSTOM_BOOTIMG_MK
```
Added after
```
ifeq ($(USE_RECOVERY_INSTALLER),true)
ifneq ($(RECOVERY_INSTALLER_PATH),)
	@echo ----- Making recovery installer for A/B devices ------
	cp -fr $(RECOVERY_INSTALLER_PATH) $(PRODUCT_OUT)/installer && cp -f $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/installer && cd $(PRODUCT_OUT)/installer && zip -qr recovery-installer ./ && cp -f $(PRODUCT_OUT)/installer/recovery-installer.zip $(PRODUCT_OUT) && rm $(PRODUCT_OUT)/installer/recovery-installer.zip && rm $(PRODUCT_OUT)/installer/ramdisk-recovery.cpio
endif
endif
```
 Then build

```
. build/envsetup.sh && export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch omni_pine-eng
mka adbd recoveryimage
cd $OUT
```
Connect your phone to your computer and run：
```
adb reboot bootloader
fastoot flash boot recovery.img
```
Kernel source code from @C457：
https://github.com/C457/android_kernel_zte_sm8150
