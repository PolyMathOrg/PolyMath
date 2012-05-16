initialization
initialize: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/3/99 "
	degreeOfFreedom := anInteger.
	reducedDOF := ( degreeOfFreedom * 2 - 1) sqrt.
	^self