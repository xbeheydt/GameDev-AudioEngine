# Copyright Xavier Beheydt. All rights reserved.

## Find and Includes
find_package(Git REQUIRED)
#! Find and Includes

## Functions
function(git_clone url path)
    if (NOT EXISTS ${path})
        execute_process(COMMAND ${GIT_EXECUTABLE} clone ${url} ${path}
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                        RESULT_VARIABLE GIT_CLONE_RESULT)
        if(NOT GIT_CLONE_RESULT EQUAL 0)
            message(FATAL_ERROR "git clone failed")
        endif()
    endif()
endfunction()
#! Functions
