# Add sources to main application
# Arguments:
#   name name of the library to add
# Implicit arguments:
#   SOURCES the sources of the library
#   HEADERS the headers of the library (only for IDE support)
# On return:
#   Library will be built and added to ${core_DEPENDS}
function(core_add_library name)
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
  add_library(${name} OBJECT ${SOURCES} ${HEADERS})
  target_include_directories(${name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

  get_property(depends GLOBAL PROPERTY core_DEPENDS)
  list(APPEND depends ${name})
  set_property(GLOBAL PROPERTY core_DEPENDS "${depends}")
endfunction()

function(core_add_public_headers directory headers)
  get_property(public_headers GLOBAL PROPERTY core_HEADERS)

  foreach(header ${headers})
    list(APPEND public_headers "${directory}/${header}")
  endforeach()

  set_property(GLOBAL PROPERTY core_HEADERS "${public_headers}")
endfunction()

