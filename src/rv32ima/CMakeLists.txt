project(rv32ima VERSION ${APP_VERSION} LANGUAGES CXX)

# ----------------------------------
# Add modules
# ----------------------------------
# add_qt_module(_qt_libs Core)
# add_qt_private_inc(_qt_private_incs Core)

# ----------------------------------
# Add target
# ----------------------------------
add_files(_src CURRENT_RECURSE PATTERNS *.h *.c *.cpp)
add_executable(${PROJECT_NAME} ${_src})

# ----------------------------------
# Target...
# ----------------------------------
target_compile_definitions(${PROJECT_NAME} PRIVATE APP_VERSION="${PROJECT_VERSION}")
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${PROJECT_NAME} PRIVATE argparse::argparse)