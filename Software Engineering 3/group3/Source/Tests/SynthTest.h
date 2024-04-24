#pragma once
#include <JuceHeader.h>
#include "../Synth.h"

class SynthTest : public juce::UnitTest
{
	public:
		SynthTest() : UnitTest("Synth Testing"){}
		void runTest() override;
};
