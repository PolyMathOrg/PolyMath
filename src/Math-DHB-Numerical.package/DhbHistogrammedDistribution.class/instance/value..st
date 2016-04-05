information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^( aNumber >= histogram minimum and: [ aNumber < histogram maximum])
		ifTrue: [ ( histogram countAt: aNumber) / ( histogram totalCount * histogram binWidth)]
		ifFalse:[ 0]