information
random
	"Answer a random number distributed according to the receiver."
	^PMNormalDistribution random * ( ( (degreeOfFreedom - 1) / self chiSquareDistribution random ) sqrt)