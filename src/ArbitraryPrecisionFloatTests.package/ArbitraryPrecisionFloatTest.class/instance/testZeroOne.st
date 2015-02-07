testing-arithmetic
testZeroOne

	self assert: (312 asArbitraryPrecisionFloatNumBits: 53) one = 1.
	self assert: (312 asArbitraryPrecisionFloatNumBits: 24) zero isZero.

	self assert: (312 asArbitraryPrecisionFloatNumBits: 53) one asInteger = 1.
	self assert: (312 asArbitraryPrecisionFloatNumBits: 24) zero asInteger isZero.