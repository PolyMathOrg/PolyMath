information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "

	^[1 - ( ( aNumber / beta negated) exp)]
			on: Error do: [ :signal | signal return: 0]