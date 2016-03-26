linear algebra
testEigenvaluesLargest
	"Code Example 8.13"

	| m charPol roots eigenvalue finder |
	m := DhbMatrix rows: #(#(3 -2 0) #(-2 7 1) #(0 1 5)).
	charPol := DhbPolynomial coefficients: #(82 -66 15 -1).
	roots := charPol roots asSortedCollection asArray reverse.
	finder := DhbLargestEigenValueFinder matrix: m.
	finder desiredPrecision: 1.0e-08.
	eigenvalue := finder evaluate.
	self assert: ((roots at: 1) - eigenvalue) abs < 1.0e-08.
	finder := finder nextLargestEigenValueFinder.
	eigenvalue := finder evaluate.
	self assert: ((roots at: 2) - eigenvalue) abs < 1.0e-08