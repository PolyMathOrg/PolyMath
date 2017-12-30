linear algebra
testEigenvalues
	"Code Example 8.15"

	| m charPol roots eigenvalues finder |
	m := PMMatrix rows: #(#(3 -2 0) #(-2 7 1) #(0 1 5)).
	charPol := PMPolynomial coefficients: #(82 -66 15 -1).
	roots := charPol roots asSortedCollection asArray reverse.
	finder := PMJacobiTransformation matrix: m.
	finder desiredPrecision: 1.0e-09.
	eigenvalues := finder evaluate.
	self assert: eigenvalues size equals: 3.
	self assert: ((roots at: 1) - (eigenvalues at: 1)) abs < 1.0e-09.
	self assert: ((roots at: 2) - (eigenvalues at: 2)) abs < 1.0e-09.
	self assert: ((roots at: 3) - (eigenvalues at: 3)) abs < 1.0e-09