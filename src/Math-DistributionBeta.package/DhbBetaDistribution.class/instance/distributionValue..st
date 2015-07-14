information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	incompleteBetaFunction isNil
		ifTrue: [ incompleteBetaFunction := DhbIncompleteBetaFunction shape: alpha1 shape: alpha2].
	^incompleteBetaFunction value: aNumber