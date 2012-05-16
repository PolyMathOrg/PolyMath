information
chiSquareDistribution
		"Private - Answer the chi square distribution used to generate
		 random numbers for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/3/99 "
	chiSquareDistribution isNil
		ifTrue: [ chiSquareDistribution := DhbChiSquareDistribution degreeOfFreedom: (degreeOfFreedom - 1)].
	^chiSquareDistribution