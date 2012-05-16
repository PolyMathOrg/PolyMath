information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	| norm |
	^( aNumber between: lowLimit and: highLimit)
		ifTrue: [ aNumber < peak
						ifTrue: [ norm := ( highLimit - lowLimit) * ( peak - lowLimit).
									 2 * ( aNumber - lowLimit) / norm
									]
						ifFalse:[ aNumber > peak
										ifTrue: [ norm := ( highLimit - lowLimit) * ( highLimit - peak).
									  				 2 * ( highLimit - aNumber) / norm
													]
										ifFalse:[ 2 / ( highLimit - lowLimit)]
									]
				   ]
		ifFalse:[ 0]