information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	aNumber < lowLimit
		ifTrue: [ ^0].
	^aNumber < highLimit
		ifTrue: [ (aNumber - lowLimit) / ( highLimit - lowLimit)]
		ifFalse:[ 1]