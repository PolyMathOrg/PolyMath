initialization
initialize: aNumber1 to: aNumber2
		"Private - Defines the limits of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	aNumber1 < aNumber2
		ifFalse: [ self error: 'Illegal distribution parameters'].
	lowLimit := aNumber1.
	highLimit := aNumber2.
	^self