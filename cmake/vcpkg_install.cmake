# Copyright Xavier Beheydt. All rights reserved.

# TODO : Check if script run in subproject

## Includes
include(cmake/git_cmd.cmake)
#! Includes

## Functions
function(vcpkg_clone)
    set(VCPKG_ROOT_DIR "${CMAKE_CURRENT_BINARY_DIR}/extern/repo/vcpkg"
        CACHE PATH "Directory repo of vcpkg")
    git_clone("https://github.com/microsoft/vcpkg" "${VCPKG_ROOT_DIR}")
endfunction()

function(vcpkg_bootstrap)
    if(WIN32)
        set(EXT "bat")
    else()
        set(EXT "sh")
    endif()
    execute_process(COMMAND "${VCPKG_ROOT_DIR}/bootstrap-vcpkg.${EXT}"
        WORKING_DIRECTORY "${VCPKG_ROOT_DIR}"
        RESULT_VARIABLE VCPKG_RESULT)
    message(STATUS "Vcpkg bootstrap running...")
    if(NOT VCPKG_RESULT EQUAL 0)
        message(FATAL_ERROR "Failed to bootstrap vcpkg")
    endif()
endfunction()
#! Functions

## Main
vcpkg_clone()
if(EXISTS "${CMAKE_CURRENT_BINARY_DIR}/extern/repo/vcpkg")
    set(VCPKG_ROOT_DIR "${CMAKE_CURRENT_BINARY_DIR}/extern/repo/vcpkg"
        CACHE PATH "Directory repo of vcpkg")
    set(CMAKE_TOOLCHAIN_FILE "${VCPKG_ROOT_DIR}/scripts/buildsystems/vcpkg.cmake"
        CACHE STRING "CMake toolchain file")
endif()

vcpkg_bootstrap()
if(EXISTS "${VCPKG_ROOT_DIR}/vcpkg.exe")
    set(VCPKG_EXE "${VCPKG_ROOT_DIR}/vcpkg.exe"
        CACHE FILEPATH "Path to vcpkg executable")
endif()
if(EXISTS "${VCPKG_ROOT_DIR}/vcpkg")
    set(VCPKG_EXE "${VCPKG_ROOT_DIR}/vcpkg"
        CACHE FILEPATH "Path to vcpkg executable")
endif()

# Setting vcpkg application at first
if(NOT EXISTS "${PROJECT_SOURCE_DIR}/vcpkg.json")
    message(STATUS "Setting vcpkg application...")
    execute_process(
        COMMAND "${VCPKG_EXE}" new --application
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}")
endif()

message(STATUS "VCPKG_EXE : ${VCPKG_EXE}")
message(STATUS "VCPKG_ROOT_DIR: ${VCPKG_ROOT_DIR}")
message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")
#! Main
