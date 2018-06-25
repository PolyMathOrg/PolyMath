information
error: aNumber
		"Compute the error on the value of the receiver for argument aNumber."
	| errorVector term nextTerm |
	nextTerm := 1.
	errorVector := ( coefficients collect: [ :each | term := nextTerm. nextTerm := aNumber * nextTerm. term]) asPMVector.
	^( errorVector * errorMatrix * errorVector) sqrt