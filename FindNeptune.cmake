#.rst:
# FindNeptune
# -------
# Finds the libNeptune library
#
# This will will define the following variables::
#
# NEPTUNE_FOUND - system has libNeptune
# NEPTUNE_INCLUDE_DIRS - the libNeptune include directory
# NEPTUNE_LIBRARIES - the libNeptune libraries
# NEPTUNE_DEFINITIONS - the libNeptune compile definitions

if(PKG_CONFIG_FOUND)
  pkg_check_modules(PC_NEPTUNE neptune QUIET)
endif()

set(NEPTUNE_VERSION ${PC_NEPTUNE_VERSION})

find_path(NEPTUNE_INCLUDE_DIR NAMES Neptune.h
                              PATHS ${PC_NEPTUNE_INCLUDEDIR})

find_library(NEPTUNE_LIBRARY NAMES Neptune
                             PATHS ${PC_NEPTUNE_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(NEPTUNE
                                  REQUIRED_VARS NEPTUNE_LIBRARY NEPTUNE_INCLUDE_DIR
                                  VERSION_VAR NEPTUNE_VERSION)

if(NEPTUNE_FOUND)
  set(NEPTUNE_LIBRARIES ${NEPTUNE_LIBRARY})
  set(NEPTUNE_INCLUDE_DIRS ${NEPTUNE_INCLUDE_DIR})
  set(NEPTUNE_DEFINITIONS -DHAVE_LIBNEPTUNE=1)
endif()

mark_as_advanced(NEPTUNE_INCLUDE_DIR NEPTUNE_LIBRARY)
