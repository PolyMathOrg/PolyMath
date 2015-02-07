testing-converting
testAsFloat
	self assert: (half asArbitraryPrecisionFloatNumBits: Float precision) asFloat = 0.5e0.
	self assert: (half asArbitraryPrecisionFloatNumBits: Float precision * 2) asFloat = 0.5e0.