# Copyright Xavier Beheydt. All rights reserved.

# TODO : Handle presets
# HACK : Move that in the presets.cmake
if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    ## C Settings
    set(CMAKE_C_STANDARD 17)
    set(CMAKE_C_STANDARD_REQUIRED ON)
    # Let's not use the GNU extensions (like -std=cXX instead of -std=gnuXX)
    set(CMAKE_C_EXTENSIONS OFF)
    #! C Settings

    ## CXX Settings
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    # Let's not use the GNU extensions (like -std=c++XX instead of -std=gnu++XX)
    set(CMAKE_CXX_EXTENSIONS OFF)
    #! CXX Settings

    # Let's nicely support folders in IDEs
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)

    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

    # include(CTest)
endif()
