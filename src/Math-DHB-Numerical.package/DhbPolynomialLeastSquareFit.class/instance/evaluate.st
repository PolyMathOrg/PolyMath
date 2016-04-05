information
evaluate
		"Perform the least square fit and answers the fitted polynomial."
	| system errorMatrix |
	system := self computeEquations.
	errorMatrix := ( system at: 1) inverse.
	^( DhbEstimatedPolynomial coefficients: errorMatrix * (system at: 2))
			errorMatrix: errorMatrix;
			yourself