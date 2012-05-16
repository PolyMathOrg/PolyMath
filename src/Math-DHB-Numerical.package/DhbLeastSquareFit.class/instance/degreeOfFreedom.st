information
degreeOfFreedom
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	degreeOfFreedom isNil
		ifTrue: [ self computeChiSquare].
	^degreeOfFreedom