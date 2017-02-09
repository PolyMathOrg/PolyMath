information
random
	"Answer a random number distributed accroding to the receiver."

	^ (PMNormalDistribution random + reducedDOF) squared / 2