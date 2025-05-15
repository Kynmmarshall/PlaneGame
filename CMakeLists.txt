cmake_minimum_required(VERSION 3.10)
project(PlaneGame)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# For Windows GUI application (no console window)
if(WIN32)
    add_definitions(-D_WINDOWS)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:WINDOWS")
endif()

# Find required libraries
find_package(OpenGL REQUIRED)
if(WIN32)
    target_link_libraries(KynmPlaneGame PRIVATE 
        winmm
        # Other Windows libraries you might need:
        # dsound
        # dxguid
        # ole32
    )
endif()

# Add source files
add_executable(PlaneGame planeGame.cpp)

# Link libraries
target_link_libraries(PlaneGame 
    ${OPENGL_LIBRARIES} 
    winmm.lib
    opengl32.lib
    freeglut.lib
    libbgi.a)

# Install targets
install(TARGETS PlaneGame
    RUNTIME DESTINATION bin
    BUNDLE DESTINATION .)

# Install game resources (sound files)
install(FILES 
    menu.wav
    play.wav
    Gameover.wav
    DESTINATION ${CMAKE_INSTALL_PREFIX}/resources)

# Install highscore file
install(FILES 
    highscore.txt
    DESTINATION ${CMAKE_INSTALL_PREFIX})

# Create an installer (Windows only)
if(WIN32)
    include(InstallRequiredSystemLibraries)
    
    set(CPACK_PACKAGE_NAME "PlaneGame")
    set(CPACK_PACKAGE_VENDOR "YourName")
    set(CPACK_PACKAGE_VERSION "1.3")
    set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A fun 2D plane dodging game")
    set(CPACK_PACKAGE_INSTALL_DIRECTORY "PlaneGame")
    set(CPACK_NSIS_MODIFY_PATH ON)  # Add to PATH
    set(CPACK_NSIS_MUI_ICON "${CMAKE_CURRENT_SOURCE_DIR}/icon.ico")
    set(CPACK_NSIS_MUI_UNIICON "${CMAKE_CURRENT_SOURCE_DIR}/icon.ico")
    set(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\PlaneGame.exe")
    set(CPACK_NSIS_DISPLAY_NAME "PlaneGame")
    set(CPACK_NSIS_HELP_LINK "http://yourwebsite.com")
    set(CPACK_NSIS_URL_INFO_ABOUT "http://yourwebsite.com")
    set(CPACK_NSIS_CONTACT "your@email.com")
    set(CPACK_NSIS_CREATE_ICONS_EXTRA "
        CreateShortCut '$DESKTOP\\\\PlaneGame.lnk' '$INSTDIR\\\\bin\\\\PlaneGame.exe'
    ")
    set(CPACK_NSIS_DELETE_ICONS_EXTRA "
        Delete '$DESKTOP\\\\PlaneGame.lnk'
    ")
    
    include(CPack)
endif()