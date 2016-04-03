information
random
		"Answer a random number distributed according to the receiver."
	| t |
	[ t := flatGenerator floatValue ln negated.
	  t > 0] whileFalse: [].
	^t ln negated * beta + alpha