/*
  ==============================================================================

    Voice.h
    Created: 21 Jan 2024 7:00:16pm
    Author:  Alexander

  ==============================================================================
*/

#pragma once
#include "Oscillator.h"
#include <JuceHeader.h>

struct Voice
{
  int note = 0;
  Oscillator osc_1;
  Oscillator osc_2; 
  juce::dsp::StateVariableTPTFilter<float> filter;
  // init ADSR object
  juce::ADSR adsr;
  // init ADSR::Parameters struct, this is needed in order to actually modify ADSR of envelope
  juce::ADSR::Parameters adsrParams;

  void reset() {
    note = 0;
    osc_1.reset();
    osc_2.reset();
    adsr.reset();
    filter.reset();
  }
    
    
  void setSampleRate(double sampleRate) {
    adsr.setSampleRate(sampleRate);
    osc_1.sampleRate = sampleRate;
    osc_2.sampleRate = sampleRate; 
  }
    
    void prepareFilter(const juce::dsp::ProcessSpec& spec) {
        filter.prepare(spec);
        filter.setType(juce::dsp::StateVariableTPTFilterType::lowpass);
        filter.setCutoffFrequency(6000.0f);
        filter.setResonance(1.0 / std::sqrt(2.0f));
    }
    
  float render() {
      
      float mix = (osc_1.sin_nextSample() + osc_2.sq_nextSample()) * adsr.getNextSample();
      
      float tempBuff[1] = { mix };
      
      float* channelPointer[1] = { tempBuff };
      
      auto block = juce::dsp::AudioBlock<float> (channelPointer, 1, 1);
      auto context = juce::dsp::ProcessContextReplacing<float> (block);
      filter.process(context);
      return tempBuff[0];
  }

};
