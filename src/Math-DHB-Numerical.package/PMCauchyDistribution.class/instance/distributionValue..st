information
distributionValue: aNumber
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber. Assumes that the value of the receiver is 0 for x < 0."
	^(( aNumber - mu) / beta) arcTan / Float pi + (1 / 2)