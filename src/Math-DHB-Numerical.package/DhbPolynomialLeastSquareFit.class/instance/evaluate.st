information
evaluate
		"Perform the least square fit and answers the fitted polynomial.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 18/3/99 "
	| system errorMatrix |
	system := self computeEquations.
	errorMatrix := ( system at: 1) inverse.
	^( DhbEstimatedPolynomial coefficients: errorMatrix * (system at: 2))
			errorMatrix: errorMatrix;
			yourself