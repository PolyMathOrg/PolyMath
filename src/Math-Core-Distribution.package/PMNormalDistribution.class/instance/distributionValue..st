information
distributionValue: aNumber
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber."
	^PMErfApproximation new value: ( ( aNumber - mu) / sigma)