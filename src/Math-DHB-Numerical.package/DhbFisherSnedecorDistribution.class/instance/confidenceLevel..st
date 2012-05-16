information
confidenceLevel: aNumber
		"Answer the probability in percent of finding a value
		 distributed according to the receiver outside of the
		 interval [ 1/aNumber, aNumber].
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/3/99 "
	aNumber < 0
		ifTrue: [ self error: 'Confidence level argument must be positive'].
	^( 1- ( self acceptanceBetween: aNumber reciprocal and: aNumber)) * 100