information
random
		"Answer a random number distributed accroding to the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	| r |
	r := DhbMitchellMooreGenerator new floatValue ln * beta negated.
	^DhbMitchellMooreGenerator new floatValue > 0.5
		ifTrue: [ mu + r]
		ifFalse:[ mu - r]