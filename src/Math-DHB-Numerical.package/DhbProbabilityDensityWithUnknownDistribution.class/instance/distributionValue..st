information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 This general purpose routine uses numerical integration."
	^( DhbRombergIntegrator function: [:x| self value:x] from: self lowestValue to: aNumber) evaluate