cmake_minimum_required(VERSION 3.2)

include(GNUInstallDirs)
include(cmake/Macros.cmake)

project(Platinum
        LANGUAGES CXX
        VERSION 1.2.0)

find_package(PkgConfig)
find_package(Neptune)

set(REQUIRED_LIBRARIES "${NEPTUNE_LIBRARIES}" CACHE INTERNAL "required libraries for ${PROJECT_NAME}" FORCE)

option(BUILD_SHARED_LIBS "Build shared libraries" ON)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/Source/Core"
                    "${CMAKE_CURRENT_SOURCE_DIR}/Source/Platinum"
                    "${CMAKE_CURRENT_SOURCE_DIR}/Source/Devices/MediaConnect"
                    "${CMAKE_CURRENT_SOURCE_DIR}/Source/Devices/MediaRenderer"
                    "${CMAKE_CURRENT_SOURCE_DIR}/Source/Devices/MediaServer"
                    "${NEPTUNE_INCLUDE_DIRS}")

add_compile_definitions("NPT_CONFIG_ENABLE_LOGGING")

add_subdirectory(Source)

configure_file(cmake/platinum.pc.cmake
               ${CMAKE_CURRENT_BINARY_DIR}/platinum.pc @ONLY)

install(TARGETS ${PROJECT_NAME}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})

get_property(headers GLOBAL PROPERTY core_HEADERS)
install(FILES ${headers}
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})

install(FILES cmake/FindPlatinum.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/platinum.pc
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
