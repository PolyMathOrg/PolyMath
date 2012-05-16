information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	^( aNumber >= histogram minimum and: [ aNumber < histogram maximum])
		ifTrue: [ ( histogram countAt: aNumber) / ( histogram totalCount * histogram binWidth)]
		ifFalse:[ 0]