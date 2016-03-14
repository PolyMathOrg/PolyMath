information
random
		"Answer a random number distributed according to the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/4/99 "
	| t |
	[ t := DhbMitchellMooreGenerator new floatValue ln negated.
	  t > 0] whileFalse: [].
	^t ln negated * beta + alpha