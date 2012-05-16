initialization
order: anInteger
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 26/4/99 "
	anInteger < 2
		ifTrue: [ self error: 'Order for Romberg integration must be larger than 1'].
	order := anInteger.