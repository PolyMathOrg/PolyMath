information
randomForSmallAlpha
		"Private - Generate a random number distributed according to the receiver
						when alpha < 1.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	[ true] whileTrue: [
	| p |
	p := DhbMitchellMooreGenerator new floatValue * self randomCoefficientsForSmallAlpha.
	p > 1
		ifTrue: [ | y |
					 y := ( ( self randomCoefficientsForSmallAlpha - p) / alpha) ln negated.
					 DhbMitchellMooreGenerator new floatValue <= ( y raisedTo: ( alpha - 1))
					 	ifTrue: [ ^y].
					]
		ifFalse: [ | y |
						y := p raisedTo: ( 1 / alpha).
					 DhbMitchellMooreGenerator new floatValue <= ( y negated exp)
					 	ifTrue: [ ^y].
					 ].
								].