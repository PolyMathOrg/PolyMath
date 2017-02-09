information
distributionValue: aNumber
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	aNumber = 0
		ifTrue: [ ^1/2].
	^( aNumber > 0
		ifTrue: [ 2 - ( self symmetricAcceptance: aNumber abs)]
		ifFalse:[ self symmetricAcceptance: aNumber abs]) / 2