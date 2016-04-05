information
degreeOfFreedom
	degreeOfFreedom isNil
		ifTrue: [ self computeChiSquare].
	^degreeOfFreedom