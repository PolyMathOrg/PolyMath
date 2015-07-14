initialization
initialize: aNumber1 shape: aNumber2 
	"Private - Initialize the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "

	(aNumber1 > 0 and: [aNumber2 > 0]) 
		ifFalse: [self error: 'Illegal distribution parameters'].
	alpha1 := aNumber1.
	alpha2 := aNumber2.
	self computeNorm.
	^self