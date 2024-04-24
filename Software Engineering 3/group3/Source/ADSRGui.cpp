/*
  ==============================================================================

    ADSRGui.cpp
    Created: 17 Mar 2024 2:57:02pm
    Author:  Alexander

  ==============================================================================
*/

#include <JuceHeader.h>
#include "ADSRGui.h"

//==============================================================================
ADSRGui::ADSRGui(juce::AudioProcessorValueTreeState& apvts)
{
  setSize(300, 300);

  attackSlider.setSliderStyle(juce::Slider::SliderStyle::LinearVertical);
  attackSlider.setTextBoxStyle(juce::Slider::TextBoxBelow, true, 48, 20);
  // attackSlider.setRange(0.1f, 5000.0f);
  attackSlider.setValue(0.1f);
  addAndMakeVisible(attackSlider);
  attackSliderAttachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, "ATTACK", attackSlider);

  decaySlider.setSliderStyle(juce::Slider::SliderStyle::LinearVertical);
  decaySlider.setTextBoxStyle(juce::Slider::TextBoxBelow, true, 48, 20);
  // decaySlider.setRange(1.0f, 2000.0f);
  decaySlider.setValue(0.5f);
  addAndMakeVisible(decaySlider);
  decaySliderAttachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, "DECAY", decaySlider);

  sustainSlider.setSliderStyle(juce::Slider::SliderStyle::LinearVertical);
  sustainSlider.setTextBoxStyle(juce::Slider::TextBoxBelow, true, 48, 20);
  // sustainSlider.setRange(0.0f, 1.0f);
  sustainSlider.setValue(0.4f);
  addAndMakeVisible(sustainSlider);
  sustainSliderAttachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, "SUSTAIN", sustainSlider);
  
  releaseSlider.setSliderStyle(juce::Slider::SliderStyle::LinearVertical);
  releaseSlider.setTextBoxStyle(juce::Slider::TextBoxBelow, true, 48, 20);
  // releaseSlider.setRange(0.1f, 5000.0f);
  releaseSlider.setValue(0.2f);
  addAndMakeVisible(releaseSlider);
  releaseSliderAttachment = std::make_unique<juce::AudioProcessorValueTreeState::SliderAttachment>(apvts, "RELEASE", releaseSlider);

}

ADSRGui::~ADSRGui(){}

void ADSRGui::resized() {
    const auto startX = 15;
    const auto startY = 35;
    const auto width = 70;
    const auto height = getHeight() - 50;
       
    attackSlider.setBounds(startX, startY, width, height);
    decaySlider.setBounds(attackSlider.getRight() + 10, startY, width, height);
    sustainSlider.setBounds(decaySlider.getRight() + 10, startY, width, height);
    releaseSlider.setBounds(sustainSlider.getRight() + 10, startY, width, height);
}
