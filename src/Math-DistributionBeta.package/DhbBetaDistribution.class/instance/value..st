information
value: aNumber 
	"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "

	^(aNumber > 0 and: [ aNumber < 1]) 
		ifTrue: 
			[( ( aNumber ln * (alpha1 - 1) ) + ( ( 1 - aNumber) ln * ( alpha2 - 1)) + logNorm) exp]
		ifFalse: [0]