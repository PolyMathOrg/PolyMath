information
asEstimatedPolynomial
		"Answer the resulting linear dependence found by the receiver in the form of a polynomial
		 with embedded error matrix.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "
	^( DhbEstimatedPolynomial coefficients: self coefficients)
			errorMatrix: self errorMatrix;
			yourself