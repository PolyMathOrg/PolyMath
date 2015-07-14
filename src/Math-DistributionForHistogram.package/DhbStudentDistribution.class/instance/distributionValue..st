information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/3/99 "
	aNumber = 0
		ifTrue: [ ^1/2].
	^( aNumber > 0
		ifTrue: [ 2 - ( self symmetricAcceptance: aNumber abs)]
		ifFalse:[ self symmetricAcceptance: aNumber abs]) / 2