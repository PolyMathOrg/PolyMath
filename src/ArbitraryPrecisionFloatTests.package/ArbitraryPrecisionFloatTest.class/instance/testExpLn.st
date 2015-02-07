testing-functions
testExpLn
	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 1 asFloat exp.

	self assert: (5 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 5 asFloat exp.
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp ln asFloat - 5 asFloat exp ln) <= 5.0 ulp.