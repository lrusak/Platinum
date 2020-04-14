set(SOURCES AVTransportSCPD.cpp
            PltMediaController.cpp
            PltMediaRenderer.cpp
            RdrConnectionManagerSCPD.cpp
            RenderingControlSCPD.cpp)

set(HEADERS PltMediaController.h
            PltMediaRenderer.h)

core_add_library(MediaRenderer)
core_add_public_headers("Source/Devices/MediaRenderer" "${HEADERS}")

