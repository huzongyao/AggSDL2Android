LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := main

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/gpc \

#Application source files here:
LOCAL_SRC_FILES := \
	$(wildcard $(LOCAL_PATH)/src/*.cpp) \
	$(wildcard $(LOCAL_PATH)/src/ctrl/*.cpp) \
	$(wildcard $(LOCAL_PATH)/gpc/*.c) \
	$(wildcard $(LOCAL_PATH)/src/platform/sdl2/*.cpp) \
	$(LOCAL_PATH)/examples/gpc_test.cpp \
	$(LOCAL_PATH)/examples/make_gb_poly.cpp \
	$(LOCAL_PATH)/examples/make_arrows.cpp \

LOCAL_SHARED_LIBRARIES := SDL2

LOCAL_CFLAGS += -w
LOCAL_LDLIBS := -llog -landroid -lGLESv1_CM -lGLESv2

include $(BUILD_SHARED_LIBRARY)

