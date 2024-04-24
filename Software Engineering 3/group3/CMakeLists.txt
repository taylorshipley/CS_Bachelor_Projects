# Declare minimum version for CMake
cmake_minimum_required(VERSION 3.15)

# Declare project target and version
project(NewProject VERSION 0.0.1)

# Add subdirectories for JUCE and the plugin
add_subdirectory(JUCE)
add_subdirectory(NewProject)
=======
set(SOURCES
    Source/ADSRControlComponent.cpp
    Source/Filters.cpp
    Source/PluginEditor.cpp
    Source/PluginProcessor.cpp
    Source/Synth.cpp
    Source/Tests/SynthTest.cpp)

set(HEADERS
    Source/12BitDACEmulation.h
    Source/ADSRControlComponent.h
    Source/Filters.h
    Source/NoiseGenerator.h
    Source/Oscillator.h
    Source/PluginEditor.h
    Source/PluginProcessor.h
    Source/Synth.h
    Source/Utils.h
    Source/Voice.h
    Source/Tests/SynthTest.h)

# Include the JUCE library
include(ExternalProject)
ExternalProject_Add(JUCE
    GIT_REPOSITORY https://github.com/juce-framework/JUCE.git
    GIT_TAG master
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/JUCE_install
)

# Add the JUCE_INSTALL_DIR to CMAKE_PREFIX_PATH so that find_package can locate JUCE
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/JUCE_install)

# Find JUCE package
add_subdirectory(JUCE)

add_executable(NewProject ${SOURCES} ${HEADERS})

# Include JUCE headers
target_include_directories(NewProject PRIVATE ${CMAKE_BINARY_DIR}/JUCE_install/modules)

# Link JUCE libraries
target_link_libraries(NewProject PRIVATE ${CMAKE_BINARY_DIR}/JUCE_install/lib/libjuce.a)

# Add dependency on JUCE_TARGET to ensure JUCE is built and installed before building NewProject
add_dependencies(NewProject JUCE)

