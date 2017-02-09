initialization
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	^aNumber > mu
		ifTrue: [ 1 - ( ( ( aNumber - mu) / beta) negated exp / 2)]
		ifFalse:[ ( ( ( aNumber - mu) / beta) exp / 2)]