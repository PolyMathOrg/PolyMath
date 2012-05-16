information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^aNumber > 0
		ifTrue: [ ( aNumber ln * (alpha - 1) - (aNumber / beta) - norm) exp]
		ifFalse:[ 0].