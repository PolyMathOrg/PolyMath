creation
derivative
		"Answer a new polynomial, derivative of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/1/99 "
	| n |
	n := coefficients size.
	^self class coefficients: ( ( coefficients collect: [ :each | n := n - 1. each * n]) reverse copyFrom: 2 to: coefficients size)