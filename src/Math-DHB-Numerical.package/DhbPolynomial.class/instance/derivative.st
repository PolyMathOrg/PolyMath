creation
derivative
	"Answer a new polynomial, derivative of the receiver."
	| n |
	n := coefficients size.
	^self class coefficients: ( ( coefficients collect: [ :each | n := n - 1. each * n]) reverse copyFrom: 2 to: coefficients size)