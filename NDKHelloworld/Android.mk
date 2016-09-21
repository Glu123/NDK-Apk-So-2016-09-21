LOCAL_PATH:= $(call my-dir)
$(warning "8888======== $(LOCAL_PATH)")#print
				
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-subdir-java-files)

LOCAL_PACKAGE_NAME := ndkhello
LOCAL_CERTIFICATE := platform

LOCAL_JNI_SHARED_LIBRARIES := libhello  #
LOCAL_REQUIRED_MODULES := libhello #

include $(BUILD_PACKAGE)	

include $(wildcard $(LOCAL_PATH)/jni/Android.mk) 
#include $(call all-subdir-makefiles) 