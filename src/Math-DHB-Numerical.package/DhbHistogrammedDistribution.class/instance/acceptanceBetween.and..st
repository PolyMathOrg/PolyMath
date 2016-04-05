information
acceptanceBetween: aNumber1 and: aNumber2
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value larger than aNumber 1 and lower than or equal to aNumber2."
	^( histogram countsBetween: ( aNumber1 max: histogram minimum)
						and: ( aNumber2 min: histogram maximum) ) / histogram totalCount