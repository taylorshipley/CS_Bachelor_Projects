# Declare plugin target with configuration
juce_add_plugin(NewProject
    VERSION 0.0.1
    PLUGIN_MANUFACTURER_CODE FLWA
    PLUGIN_CODE SYNT
    FORMATS AU VST3
    PRODUCT_NAME "Synth")

# Generate the JUCE header file for our source code
juce_generate_juce_header(NewProject)

# Add source files to target
target_sources(NewProject PRIVATE
    Source/PluginEditor.cpp
    Source/PluginProcessor.cpp
    Source/Synth.cpp
    Source/Filters.cpp
    Source/ADSRGui.cpp
    Source/FilterGui.cpp)

# Provide preprocessor definitions for JUCE
target_compile_definitions(NewProject PUBLIC
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_VST3_CAN_REPLACE_VST2=0)

# Link JUCE audio utils library to plugin target
target_link_libraries(NewProject PRIVATE
    juce::juce_audio_utils)
