#.rst:
# FindPlatinum
# -------
# Finds the libPlatinum library
#
# This will will define the following variables::
#
# PLATINUM_FOUND - system has libPlatinum
# PLATINUM_INCLUDE_DIRS - the libPlatinum include directory
# PLATINUM_LIBRARIES - the libPlatinum libraries
# PLATINUM_DEFINITIONS - the libPlatinum compile definitions

if(PKG_CONFIG_FOUND)
  pkg_check_modules(PC_PLATINUM platinum QUIET)
endif()

set(PLATINUM_VERSION ${PC_PLATINUM_VERSION})

find_path(PLATINUM_INCLUDE_DIR NAMES Platinum.h
                              PATHS ${PC_PLATINUM_INCLUDEDIR})

find_library(PLATINUM_LIBRARY NAMES Platinum
                             PATHS ${PC_PLATINUM_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PLATINUM
                                  REQUIRED_VARS PLATINUM_LIBRARY PLATINUM_INCLUDE_DIR
                                  VERSION_VAR PLATINUM_VERSION)

if(PLATINUM_FOUND)
  set(PLATINUM_LIBRARIES ${PLATINUM_LIBRARY})
  set(PLATINUM_INCLUDE_DIRS ${PLATINUM_INCLUDE_DIR})
  set(PLATINUM_DEFINITIONS -DHAVE_LIBPLATINUM=1)
endif()

mark_as_advanced(PLATINUM_INCLUDE_DIR PLATINUM_LIBRARY)
