information
random
	"Answer a random number distributed according to the receiver."
	chiSquareDistribution1 isNil
		ifTrue: [ chiSquareDistribution1 := PMChiSquareDistribution degreeOfFreedom: dof1.
				  chiSquareDistribution2 := PMChiSquareDistribution degreeOfFreedom: dof2.
				].
	^chiSquareDistribution1 random * dof2 / ( chiSquareDistribution2 random * dof1)