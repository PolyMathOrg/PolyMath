information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^aNumber > 0
		ifTrue: [ ( normalDistribution value: aNumber ln) / aNumber]
		ifFalse:[ 0]