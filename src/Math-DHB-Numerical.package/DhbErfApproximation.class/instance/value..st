information
value: aNumber
		"Answer erf( aNumber) using an approximation from Abramovitz and Stegun, Handbook of Mathematical Functions.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/1/99 "
	| t |
	aNumber = 0
		ifTrue: [ ^0.5].
	aNumber > 0
		ifTrue: [ ^1- ( self value: aNumber negated)].
	aNumber < -20
		ifTrue: [ ^0].
	t := 1 / (1 - (constant * aNumber)).
	^( series value: t) * t * (self normal: aNumber)