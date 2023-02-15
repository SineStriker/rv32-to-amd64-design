include_guard(GLOBAL)

# ----------------------------------
# Project directory configuration
# ----------------------------------
set(REPOSITORY_ROOT_DIR ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "Repository root directory") # Root dir
set(REPOSITORY_VCPKG_DIR ${REPOSITORY_ROOT_DIR}/vcpkg CACHE STRING "Vcpkg directory") # Vcpkg dir

set(PROJECT_MODULES_DIR ${REPOSITORY_ROOT_DIR}/scripts/cmake/Modules CACHE STRING "Custom CMake scripts") # Scripts

# ----------------------------------
# Initialization
# ----------------------------------
include(${PROJECT_MODULES_DIR}/Basic.cmake)

# ----------------------------------
# Build system configuration
# ----------------------------------
option_ex(APP_NAME rv32ima)
option_ex(APP_VERSION 0.0.0.1)