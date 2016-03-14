information
value: aNumber
		"Compute the value of the Lagrange interpolation polynomial on the receiver's points at aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| answer size |
	coefficients isNil
		ifTrue: [ self computeCoefficients].
	size := coefficients size.
	answer := coefficients at: size.
	(size - 1) to: 1 by: -1
		do: [ :n | answer := answer * ( aNumber - (self xPointAt:  n)) + ( coefficients at: n)].
	^answer