initialization
initialize: aNumber1 scale: aNumber2
		"Private - Initialize the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	aNumber2 > 0
		ifFalse: [ self error: 'Illegal distribution parameters'].
	alpha := aNumber1.
	beta := aNumber2.
	^self