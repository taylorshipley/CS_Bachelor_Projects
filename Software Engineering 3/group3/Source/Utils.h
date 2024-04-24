/*
  ==============================================================================

    Utils.h
    Created: 21 Jan 2024 7:38:13pm
    Author:  Alexander

  ==============================================================================
*/

#pragma once

inline void earProtection(float* buffer, int sampleCount)
{
    if (buffer == nullptr) { return; }
    bool firstWarning = true;
    for (int i = 0; i < sampleCount; ++i) {
        float x = buffer[i];
        bool silence = false;
        if (std::isnan(x)) {
            DBG("WARNING: nan detected in audio buffer, silencing");
            silence = true;
        } else if (std::isinf(x)) {
            DBG("WARNING: inf detected in audio buffer, silencing");
            silence = true;
        } else if (x < -2.0f || x > 2.0f) {
            DBG("WARNING: sample out of range, LIMITING");
            silence = true;
        } else if (x < -1.0f) {
            if (firstWarning) {
                DBG("Sample out of range!");
                firstWarning = false;
            }
            buffer[i] = 1.0f;
        }
        if(silence) {
            memset(buffer, 0, sampleCount * sizeof(float));
            return; 
        }
    }
}
