/*
  ==============================================================================

    Synth.cpp
    Created: 21 Jan 2024 7:00:37pm
    Author:  Alexander

  ==============================================================================
*/

#include "Synth.h"
#include "PluginProcessor.h"
#include "Utils.h"
#include <cmath>

Synth::Synth()
{
    sampleRate = 44100.0f;
}

void Synth::reset()
{
    for(int i = 0; i < MAX_VOICES; ++i) {
        voices[i].reset();
    }
    
    lowpassFilter.reset();
}

void Synth::allocateResources(double sampleRate_, int samplesPerBlock)
{
    sampleRate = static_cast<float>(sampleRate_);
    // pass sample rate to adsr object in order to properly set up ADSR 
    // Creating filter
    juce::dsp::ProcessSpec filterSpec;

    filterSpec.maximumBlockSize = samplesPerBlock;
    filterSpec.sampleRate = sampleRate;
    filterSpec.numChannels = 1;
    
    for(int i = 0; i < MAX_VOICES; ++i) {
        voices[i].adsr.setSampleRate(sampleRate);
        voices[i].prepareFilter(filterSpec);
    }
}

void Synth::deallocateResources()
{
    
}

void Synth::render(float** outputBuffers, int sampleCount)
{
    float* outputBufferLeft = outputBuffers[0];
    float* outputBufferRight = outputBuffers[1];
    
    // 1
    for (int sample = 0; sample < sampleCount; ++sample) {
        float output = 0.0f;
        int activeVoices = 0;
        for(int i = 0; i < MAX_VOICES; ++i) {
            if (voices[i].note > 0) {
                // Filter Needs to go here
                output += voices[i].render();
                activeVoices++;
            }
        }
        
        if(activeVoices > 0) {
            output /= activeVoices;
        }
        
        if(output == 1.0f) {
            output = 0.95;
        }
        // 5
        outputBufferLeft[sample] = output;
        if (outputBufferRight != nullptr) {
            outputBufferRight[sample] = output; 
        }
    }
    
    earProtection(outputBufferLeft, sampleCount);
    earProtection(outputBufferRight, sampleCount);
    
}

void Synth::noteOn(int note, int velocity)
{
    // This is for monophonic synths, ensures that the release of the previous note is interrupted from previous note in order to "set it up" again
//    if(voice.note > 0) {
//    }
//    voice.adsr.reset();
    
    int voice_index = -1;
    
    for(int i = 0; i < MAX_VOICES; ++i) {
        if(!voices[i].adsr.isActive()) {
            voice_index = i;
            break;
        }
    }
    
    if(voice_index == -1) {
        voice_index = 0;
    }
    
    startNewVoice(voice_index, note, velocity);
//    voices[voice_index].adsr.reset();

//    voice.osc.reset();
    
    // // set up env param values
    // voice.adsrParams.attack = attack;
    // voice.adsrParams.decay = decay;
    // voice.adsrParams.sustain = sustain;
    // voice.adsrParams.release = release;

    // // actually set them on the adsr by passing the params
    // voice.adsr.setParameters(voice.adsrParams);
    
    // calls class method noteOn for adsr in juce::ADSR
}

void Synth::noteOff(int note)
{
    for(int i = 0; i < MAX_VOICES; ++i) {
        if(voices[i].note == note) {
            // calls class method noteOff for ADSR in juce::ADSR, this sets whatever state the ADSR is in to automatically to state: release
            voices[i].adsr.noteOff();
//            voices[i].note = 0;
        }
    }
}


void Synth::startNewVoice(int voice_index, int note, int velocity) {
    
    voices[voice_index].note = note;
    float freq = 440.0f * std::pow(2.0f, float(note - 69) / 12.0f);
    voices[voice_index].osc_1.setFrequency(freq, sampleRate);
    voices[voice_index].osc_2.setFrequency(freq, sampleRate);
    voices[voice_index].adsr.noteOn();
}

void Synth::midiMessage(uint8_t data0, uint8_t data1, uint8_t data2)
{
    switch (data0 & 0xF0) {
        // Note Off
        case 0x80:
            noteOff(data1 & 0x7F);
            break;
        
        //Note On
        case 0x90: {
            uint8_t note = data1 & 0x7F;
            uint8_t velo = data2 & 0x7F;
            if (velo > 0) {
                noteOn(note, velo);
            } else {
                noteOff(note);
            }
            break;
            
        }
    }
}
