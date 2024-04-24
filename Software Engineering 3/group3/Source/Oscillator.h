/*
  ==============================================================================

    Oscillator.h
    Created: 21 Jan 2024 7:48:18pm
    Author:  Alexander

  ==============================================================================
*/

#pragma once
#include <cmath>

const float PI_OVER_4 = 0.7853981633974483f;
const float PI = 3.1415926535897932f;
const float TWO_PI = 6.2831853071795864f;

class Oscillator
{
    public:
        float amplitude = 1.0f;
        float phase = 0.0f;
        float sampleRate = 44100.0f;
        float frequency = 440.0f; 

    private:

    public:
        void setFrequency(float freq, float currentSampleRate) {
            frequency = freq;
            sampleRate = currentSampleRate;
        }

         void reset() {
             phase = 0.0f;
         }
    
    // Implemented after Alan Wolfe's AdvanceOscilator_Sine() function
    // https://blog.demofox.org/2012/05/19/diy-synthesizer-chapter-2-common-wave-forms/
    // Further implemented in rcliftonharvey - rchoscillators
    
        float sin_nextSample() {
            double phaseIncrement = TWO_PI * frequency / sampleRate;
            phase += phaseIncrement;
            phase = fmod(phase, TWO_PI);
            return std::sin(phase) * amplitude;
        }

        float sq_nextSample() {
            phase += frequency / sampleRate;
            
            while(phase > 1.0f) {
                phase -= 1.0f;
            }
            
            while (phase < 0.0f) {
                phase += 1.0f;
            }
            
            if (phase <= 0.5f) {
                return -1.0f;
            } else {
                return 1.0f;
            }
        }
};
