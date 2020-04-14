set(SOURCES PltMediaConnect.cpp
            PltXbox360.cpp
            X_MS_MediaReceiverRegistrarSCPD.cpp)

set(HEADERS PltMediaConnect.h
            PltXbox360.h)

core_add_library(MediaConnect)
core_add_public_headers("Source/Devices/MediaConnect" "${HEADERS}")
