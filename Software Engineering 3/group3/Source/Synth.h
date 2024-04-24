/*
  ==============================================================================

    Synth.h
    Created: 21 Jan 2024 7:00:37pm
    Author:  Alexander

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "Voice.h"

static const int MAX_VOICES = 4;

class Synth
{
public:
  Synth();

  void allocateResources(double sampleRate, int samplesPerBlock);
  void deallocateResources();
  void reset();
  void render(float** outputBuffers, int sampleCount);
  void midiMessage(uint8_t data0, uint8_t data1, uint8_t data2);

  Voice voices[MAX_VOICES]; 
  juce::dsp::StateVariableTPTFilter<float> lowpassFilter;

        
private:
  float sampleRate;
  void noteOn(int note, int velocity);
  void noteOff(int note);
  void startNewVoice(int voice_index, int note, int velocity);
    
    

};

