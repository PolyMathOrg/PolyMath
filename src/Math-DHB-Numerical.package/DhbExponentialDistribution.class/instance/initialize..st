initialization
initialize: aNumber
		"Private - Set the scale parameter of the receiver to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	aNumber > 0
		ifFalse: [ self error: 'Illegal distribution parameters'].
	beta := aNumber.
	^self