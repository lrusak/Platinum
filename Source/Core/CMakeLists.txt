set(SOURCES PltAction.cpp
            PltArgument.cpp
            PltConstants.cpp
            PltCtrlPoint.cpp
            PltCtrlPointTask.cpp
            PltDatagramStream.cpp
            PltDeviceData.cpp
            PltDeviceHost.cpp
            PltEvent.cpp
            PltHttpClientTask.cpp
            PltHttp.cpp
            PltHttpServer.cpp
            PltHttpServerTask.cpp
            PltIconsData.cpp
            PltMimeType.cpp
            PltProtocolInfo.cpp
            PltService.cpp
            PltSsdp.cpp
            PltStateVariable.cpp
            PltTaskManager.cpp
            PltThreadTask.cpp
            PltUPnP.cpp)

set(HEADERS PltAction.h
            PltArgument.h
            PltConstants.h
            PltCtrlPoint.h
            PltCtrlPointTask.h
            PltDatagramStream.h
            PltDeviceData.h
            PltDeviceHost.h
            PltEvent.h
            PltHttpClientTask.h
            PltHttp.h
            PltHttpServer.h
            PltHttpServerTask.h
            PltMimeType.h
            PltProtocolInfo.h
            PltService.h
            PltSsdp.h
            PltStateVariable.h
            PltTaskManager.h
            PltThreadTask.h
            PltUPnP.h
            PltUtilities.h)

core_add_public_headers("Source/Core" "${HEADERS}")

add_library(${PROJECT_NAME} ${SOURCES} ${HEADERS})
get_property(DEPENDS GLOBAL PROPERTY core_DEPENDS)
target_link_libraries(${PROJECT_NAME} PUBLIC ${DEPENDS})
set_target_properties(${PROJECT_NAME} PROPERTIES
                                      VERSION ${PROJECT_VERSION})
add_dependencies(${PROJECT_NAME} ${DEPENDS})

if(CMAKE_SYSTEM_NAME STREQUAL "WindowsStore")
  set_target_properties(${PROJECT_NAME} PROPERTIES STATIC_LIBRARY_FLAGS "/ignore:4264")
endif()
