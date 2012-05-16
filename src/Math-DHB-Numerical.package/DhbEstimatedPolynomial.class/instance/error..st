information
error: aNumber
		"Compute the error on the value of the receiver for argument aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "
	| errorVector term nextTerm |
	nextTerm := 1.
	errorVector := ( coefficients collect: [ :each | term := nextTerm. nextTerm := aNumber * nextTerm. term]) asVector.
	^( errorVector * errorMatrix * errorVector) sqrt