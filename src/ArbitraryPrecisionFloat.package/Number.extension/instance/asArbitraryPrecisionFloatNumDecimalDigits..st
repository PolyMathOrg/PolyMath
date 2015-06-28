*ArbitraryPrecisionFloat
asArbitraryPrecisionFloatNumDecimalDigits: n
	^ self asArbitraryPrecisionFloatNumBits: (n / (2 log: 10)) ceiling