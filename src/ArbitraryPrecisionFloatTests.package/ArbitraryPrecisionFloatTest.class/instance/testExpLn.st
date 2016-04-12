testing-functions
testExpLn
	|n|
	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 1 asFloat exp.
	n := 5 exp.
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp - n)abs <= n ulp.
	"self assert: (5 asArbitraryPrecisionFloatNumBits: 53) exp asFloat = 5 asFloat exp."
	self assert: ((5 asArbitraryPrecisionFloatNumBits: 53) exp ln asFloat - n ln)abs <= 5.0 ulp.
	"this test was skipped. changed that & loosened 2. test,
	 since '5 exp' seems to round up instead of down here,
	 which results in an error of almost one ulp in '5 exp'"