double dispatching
timesNumber: aNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	^self class coefficients: ( coefficients reverse collect: [ :each | each * aNumber])