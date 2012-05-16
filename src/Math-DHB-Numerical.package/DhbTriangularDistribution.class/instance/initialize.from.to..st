initialization
initialize: aNumber1 from: aNumber2 to: aNumber3
		"Private - Defines the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	( aNumber2 < aNumber3 and: [ aNumber1 between: aNumber2 and: aNumber3])
		ifFalse: [ self error: 'Illegal distribution parameters'].
	peak := aNumber1.
	lowLimit := aNumber2.
	highLimit := aNumber3.
	^self