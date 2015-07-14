information
randomForLargeAlpha
		"Private - Generate a random number distributed according to the receiver
						when alpha > 1.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/3/99 "
	[ true] whileTrue: [
	| u1 u2 c v y z w|
	u1 := DhbMitchellMooreGenerator new floatValue.
	u2 := DhbMitchellMooreGenerator new floatValue.
	c := self randomCoefficientsForLargeAlpha.
	v := ( u1 / ( 1 - u1)) ln * (c at: 1).
	y := v exp * alpha.
	z := u1 squared * u2.
	w := ( c at: 3) * v + ( c at: 2) - y.
	( c at: 4) + w >= ( 4.5 * z) ifTrue: [ ^y].
	z ln <= w ifTrue: [ ^y].
								].