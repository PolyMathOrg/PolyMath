information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 14/4/99 "
	| arg |
	arg := ( aNumber - alpha) / beta.
	arg := arg < DhbFloatingPointMachine new largestExponentArgument negated
					ifTrue: [ ^0]
					ifFalse:[arg negated exp].
	^arg > DhbFloatingPointMachine new largestExponentArgument ifTrue: [ 1]
						ifFalse:[ arg negated exp]