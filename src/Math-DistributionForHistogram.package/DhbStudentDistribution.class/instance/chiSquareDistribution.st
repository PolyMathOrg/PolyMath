information
chiSquareDistribution
	"Answer the chi square distribution used to generate random numbers for the receiver."
	chiSquareDistribution isNil
		ifTrue: [ chiSquareDistribution := DhbChiSquareDistribution degreeOfFreedom: (degreeOfFreedom - 1)].
	^chiSquareDistribution