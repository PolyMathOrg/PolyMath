testing-arithmetic
testPi
	"check computation of pi"

	self assert: (1 asArbitraryPrecisionFloatNumBits: 53) pi = Float pi.