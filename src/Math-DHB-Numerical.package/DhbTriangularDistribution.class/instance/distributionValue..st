information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
		"changed last line so that 1 is returned, if aNumber >highLimit "
	| norm |
	^( aNumber between: lowLimit and: highLimit)
		ifTrue: [ aNumber < peak
						ifTrue: [ norm := ( highLimit - lowLimit) * ( peak - lowLimit).
									 ( aNumber - lowLimit) squared / norm
									]
						ifFalse:[ aNumber > peak
										ifTrue: [ norm := ( highLimit - lowLimit) * ( highLimit - peak).
									  				 1 - ( ( highLimit - aNumber) squared / norm)
													]
										ifFalse:[ ( peak - lowLimit) / ( highLimit - lowLimit)]
									]
				   ]
		ifFalse:[ aNumber >lowLimit ifTrue: [1] ifFalse: [0]]