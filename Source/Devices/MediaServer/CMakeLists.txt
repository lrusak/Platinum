set(SOURCES ConnectionManagerSCPD.cpp
            ContentDirectorySCPD.cpp
            ContentDirectorywSearchSCPD.cpp
            PltDidl.cpp
            PltFileMediaServer.cpp
            PltMediaBrowser.cpp
            PltMediaCache.cpp
            PltMediaItem.cpp
            PltMediaServer.cpp
            PltSyncMediaBrowser.cpp)

set(HEADERS PltDidl.h
            PltFileMediaServer.h
            PltMediaBrowser.h
            PltMediaCache.h
            PltMediaItem.h
            PltMediaServer.h
            PltSyncMediaBrowser.h)

core_add_library(MediaServer)
core_add_public_headers("Source/Devices/MediaServer" "${HEADERS}")
