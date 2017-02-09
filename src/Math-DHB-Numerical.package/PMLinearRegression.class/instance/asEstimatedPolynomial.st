information
asEstimatedPolynomial
		"Answer the resulting linear dependence found by the receiver in the form of a polynomial
		 with embedded error matrix."
	^( PMEstimatedPolynomial coefficients: self coefficients)
			errorMatrix: self errorMatrix;
			yourself