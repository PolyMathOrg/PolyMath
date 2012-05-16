information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 Assumes that the value of the receiver is 0 for x < 0.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^(( aNumber - mu) / beta) arcTan / Float pi + (1 / 2)