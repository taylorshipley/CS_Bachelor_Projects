/*
  ==============================================================================

    FilterGui.h
    Created: 14 Apr 2024 3:10:35pm
    Author:  Alexander

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

class FilterGui : public juce::Component {
public:
    FilterGui(juce::AudioProcessorValueTreeState& apvts);
    ~FilterGui() override;
    
    void resized() override;

private:
    juce::Slider cutoffSlider;
    juce::Slider resonanceSlider;
    
    std::unique_ptr<juce::AudioProcessorValueTreeState::SliderAttachment> cutoffSliderAttachment;
    std::unique_ptr<juce::AudioProcessorValueTreeState::SliderAttachment> resonanceSliderAttachment;
    
    static constexpr int sliderWidth = 50;
    static constexpr int sliderHeight = 260;
    
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(FilterGui)
};
