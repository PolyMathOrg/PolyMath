information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 Assumes that the value of the receiver is 0 for x < 0."
	^aNumber > 0
		ifTrue: [ 1 - ( ( ( aNumber / beta) raisedTo: alpha) negated exp)]
		ifFalse:[ 0]