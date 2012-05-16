information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/3/99 "
	| x |
	^aNumber > 0
		ifTrue: [ x := (aNumber * 2) sqrt.
				  ( DhbErfApproximation new value: (x - reducedDOF))
				]
		ifFalse:[ 0]