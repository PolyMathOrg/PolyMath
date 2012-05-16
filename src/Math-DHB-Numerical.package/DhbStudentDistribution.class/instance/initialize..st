initialization
initialize: anInteger
		"Private - Initialize the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	anInteger > 0
		ifFalse: [ self error: 'Degree of freedom must be positive'].
	degreeOfFreedom := anInteger.
	self computeNorm.
	^self