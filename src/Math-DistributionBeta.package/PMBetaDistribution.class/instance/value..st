information
value: aNumber 
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."

	^(aNumber > 0 and: [ aNumber < 1]) 
		ifTrue: 
			[( ( aNumber ln * (alpha1 - 1) ) + ( ( 1 - aNumber) ln * ( alpha2 - 1)) + logNorm) exp]
		ifFalse: [0]