information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 This general purpose routine uses numerical integration.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^( DhbRombergIntegrator new: self from: self lowestValue to: aNumber) evaluate