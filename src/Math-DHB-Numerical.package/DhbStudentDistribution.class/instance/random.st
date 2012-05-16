information
random
		"Answer a random number distributed according to the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	^DhbNormalDistribution random * ( ( (degreeOfFreedom - 1) / self chiSquareDistribution random ) sqrt)