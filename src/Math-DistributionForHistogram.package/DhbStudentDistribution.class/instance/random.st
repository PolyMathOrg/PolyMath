information
random
	"Answer a random number distributed according to the receiver."
	^DhbNormalDistribution random * ( ( (degreeOfFreedom - 1) / self chiSquareDistribution random ) sqrt)