information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/3/99 "
	| x |
	^aNumber > 0
		ifTrue: [ x := (aNumber * 2) sqrt.
				  ( DhbErfApproximation new normal: (x - reducedDOF)) / x
				]
		ifFalse:[ 0]