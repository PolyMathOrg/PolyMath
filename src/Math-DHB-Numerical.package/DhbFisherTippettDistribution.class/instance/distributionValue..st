information
distributionValue: aNumber
		"Answers the probability of observing a random variable distributed according to
		 the receiver with a value lower than or equal to aNumber."
	| arg |
	arg := ( aNumber - alpha) / beta.
	arg := arg < DhbFloatingPointMachine new largestExponentArgument negated
					ifTrue: [ ^0]
					ifFalse:[arg negated exp].
	^arg negated exp