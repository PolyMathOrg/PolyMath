information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^aNumber < histogram minimum
		ifTrue: [ 0]
		ifFalse:[ aNumber < histogram maximum
							ifTrue: [ ( histogram countsUpTo: aNumber) / histogram totalCount]
							ifFalse:[ 1]
					]