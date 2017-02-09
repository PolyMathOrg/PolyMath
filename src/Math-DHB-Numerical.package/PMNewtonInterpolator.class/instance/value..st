information
value: aNumber
	"Compute the value of the Lagrange interpolation polynomial on the receiver's points at aNumber."
	| answer size |
	coefficients isNil
		ifTrue: [ self computeCoefficients].
	size := coefficients size.
	answer := coefficients at: size.
	(size - 1) to: 1 by: -1
		do: [ :n | answer := answer * ( aNumber - (self xPointAt:  n)) + ( coefficients at: n)].
	^answer