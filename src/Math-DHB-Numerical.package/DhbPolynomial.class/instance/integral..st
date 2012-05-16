creation
integral: aValue
		"Answer a new polynomial, integral of the receiver with given value at x=0.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 4/1/99 "
	| n |
	n := coefficients size + 1.
	^self class coefficients: ( ( coefficients collect: [ :each | n := n - 1. each / n]) copyWith: aValue) reverse