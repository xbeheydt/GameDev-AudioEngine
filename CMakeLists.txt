# Copyright Xavier Beheydt. All rights reserved.
cmake_minimum_required(VERSION 3.15)

### Install and Configure VCPKG
include(cmake/vcpkg_install.cmake)

project(
    AudioEngine
    VERSION 1.0.0
    DESCRIPTION "Audio Engine is a part of the Grafel Game Engine"
    LANGUAGES C CXX
)

include(cmake/presets.cmake)
include(cmake/dependencies.cmake)

## Subdirectories
add_subdirectory("Examples")
#! Subdirectories
