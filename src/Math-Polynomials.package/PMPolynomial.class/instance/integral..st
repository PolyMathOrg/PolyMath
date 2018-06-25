creation
integral: aValue
	"Answer a new polynomial, integral of the receiver with given value at x=0."
	| n |
	n := coefficients size + 1.
	^self class coefficients: ( ( coefficients collect: [ :each | n := n - 1. each / n]) copyWith: aValue) reverse