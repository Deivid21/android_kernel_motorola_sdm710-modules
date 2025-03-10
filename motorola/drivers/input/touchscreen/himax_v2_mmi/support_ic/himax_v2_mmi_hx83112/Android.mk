DLKM_DIR := kernel/motorola/sdm710-modules/motorola
LOCAL_PATH := $(call my-dir)

ifeq ($(DLKM_INSTALL_TO_VENDOR_OUT),true)
HIMAX_MMI_IC_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/modules/
else
HIMAX_MMI_IC_MODULE_PATH := $(KERNEL_MODULES_OUT)
endif

KERNEL_CFLAGS += CONFIG_INPUT_HIMAX_V2_MMI_IC_NAME=hx83112

ifneq ($(BOARD_USES_TOUCH_PALM),)
	KERNEL_CFLAGS += CONFIG_INPUT_TOUCHSCREEN_HIMAX_V2_MMI_ENABLE_PALM=y
endif

include $(CLEAR_VARS)
LOCAL_MODULE := himax_v2_mmi_hx83112.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(HIMAX_MMI_IC_MODULE_PATH)
LOCAL_REQUIRED_MODULES := himax_v2_mmi.ko
include $(DLKM_DIR)/AndroidKernelModule.mk
