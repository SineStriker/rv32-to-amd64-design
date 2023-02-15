cmake_minimum_required(VERSION 3.17)

set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)

include(../Config.cmake)

# ----------------------------------
# Main project
# ----------------------------------
project(${APP_NAME} VERSION ${APP_VERSION} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ----------------------------------
# Import vcpkg and libraries
# ----------------------------------
# set(VCPKG_APPLOCAL_DEPS off) # Tell vcpkg not to copy dlls automatically on Windows
include(${REPOSITORY_VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake)

# ----------------------------------
# Build configuration
# ----------------------------------
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

if(WIN32)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /manifest:no")
    set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} /manifest:no")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /manifest:no")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /utf-8")
endif()

# Find pre-built libraries
find_package(argparse REQUIRED)

# Include common utils
include(${PROJECT_MODULES_DIR}/Deploy.cmake)
include(${PROJECT_MODULES_DIR}/FindUtil.cmake)
include(${PROJECT_MODULES_DIR}/Link.cmake)
include(${PROJECT_MODULES_DIR}/ListUtil.cmake)
include(${PROJECT_MODULES_DIR}/Target.cmake)

# ----------------------------------
# Add sub-projects
# ----------------------------------
add_subdirectory(rv32ima)