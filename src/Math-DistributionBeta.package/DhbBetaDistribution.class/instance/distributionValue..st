information
distributionValue: aNumber
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	
	incompleteBetaFunction isNil
		ifTrue: [ incompleteBetaFunction := DhbIncompleteBetaFunction shape: alpha1 shape: alpha2].
	^aNumber <= 0.0 ifTrue:[0]ifFalse:[aNumber >= 1.0 ifTrue:[1] ifFalse:[incompleteBetaFunction value: aNumber]]