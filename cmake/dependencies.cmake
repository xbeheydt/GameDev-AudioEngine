# Copyright Xavier Beheydt. All rights reserved.

## Main
find_path(MINIAUDIO_INCLUDE_DIR "miniaudio.h")
if (NOT MINIAUDIO_INCLUDE_DIR)
    message(FATAL_ERROR "miniaudio not found")
endif()
#! Main
