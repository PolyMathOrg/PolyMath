iterative algorithms
testPolynomialRoots
	"Code Example 5.5"
	| polynomial roots |
	polynomial := DhbPolynomial coefficients: #( -10 -13 -2 1).
	roots := polynomial roots asSortedCollection asArray.
	self should: [ roots size = 3].
	self should: [ ( (roots at: 1) + 2) abs < DhbFloatingPointMachine new defaultNumericalPrecision].
	self should: [ ( (roots at: 2) + 1) abs < DhbFloatingPointMachine new defaultNumericalPrecision].
	self should: [ ( (roots at: 3) - 5) abs < DhbFloatingPointMachine new defaultNumericalPrecision].