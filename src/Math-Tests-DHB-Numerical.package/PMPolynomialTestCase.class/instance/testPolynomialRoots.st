iterative algorithms
testPolynomialRoots
	"Code Example 5.5"

	| polynomial roots |
	polynomial := PMPolynomial coefficients: #(-10 -13 -2 1).
	roots := polynomial roots asSortedCollection asArray.
	self assert: roots size equals: 3.
	self
		assert:
			((roots at: 1) + 2) abs
				< PMFloatingPointMachine new defaultNumericalPrecision.
	self
		assert:
			((roots at: 2) + 1) abs
				< PMFloatingPointMachine new defaultNumericalPrecision.
	self
		assert:
			((roots at: 3) - 5) abs
				< PMFloatingPointMachine new defaultNumericalPrecision