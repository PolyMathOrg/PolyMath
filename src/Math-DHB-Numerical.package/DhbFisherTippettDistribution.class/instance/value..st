information
value: aNumber
		"Answers the probability that a random variable distributed according to the receiver
		 gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	| arg |
	arg := ( aNumber - alpha) / beta.
	arg := arg > DhbFloatingPointMachine new largestExponentArgument ifTrue: [ ^0]
						ifFalse:[arg negated exp + arg].
	^arg > DhbFloatingPointMachine new largestExponentArgument ifTrue: [ 0]
						ifFalse:[ arg negated exp / beta]