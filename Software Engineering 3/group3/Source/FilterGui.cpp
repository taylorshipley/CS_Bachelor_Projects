/*
  ==============================================================================

    FilterGui.cpp
    Created: 14 Apr 2024 3:10:35pm
    Author:  Alexander

  ==============================================================================
*/
#include <JuceHeader.h>
#include "FilterGui.h"

FilterGui::FilterGui(juce::AudioProcessorValueTreeState& apvts) {
    setSize(300, 300);
    
    cutoffSlider.setSliderStyle(juce::Slider::SliderStyle::Rotary);
    cutoffSlider.setTextBoxStyle(juce::Slider::TextBoxBelow, true, 48, 20);
    cutoffSlider.setRange(20.0, 20000.0, 0.01);
    cutoffSlider.setSkewFactorFromMidPoint(1000.0);
    cutoffSlider.setValue(18000.0);
    addAndMakeVisible(cutoffSlider);
    cutoffSliderAttachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, "CUTOFF", cutoffSlider);
    
    resonanceSlider.setSliderStyle(juce::Slider::SliderStyle::RotaryVerticalDrag);
    resonanceSlider.setTextBoxStyle(juce::Slider::TextBoxBelow, true, 48, 20);
    resonanceSlider.setRange(0.0, 1.0, 0.01);
    resonanceSlider.setValue(0.5);
    addAndMakeVisible(resonanceSlider);
    resonanceSliderAttachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, "RESONANCE", resonanceSlider);
}

FilterGui::~FilterGui(){}

void FilterGui::resized() {
    const auto startX = 15;
    const auto startY = 35;
    const auto width = 70;
    const auto height = getHeight() - 50;
    
    cutoffSlider.setBounds(startX, startY, width, height);
    resonanceSlider.setBounds(cutoffSlider.getRight() + 10, startY, width, height); 
}
