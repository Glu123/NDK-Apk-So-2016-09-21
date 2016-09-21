LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
$(warning "8888======== $(LOCAL_PATH)")#print
LOCAL_SRC_FILES := hello.c
LOCAL_MODULE    := libhello
include $(BUILD_SHARED_LIBRARY)