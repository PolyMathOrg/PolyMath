initialization
computeInitialValues
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 05-Jan-00 "
	unidimensionalFinder := DhbOneVariableFunctionOptimizer forOptimizer: self.
	unidimensionalFinder desiredPrecision: desiredPrecision.
	bestPoints := ( 1 to: result size)
							collect: [ :n |
									   ( DhbVectorProjectedFunction function: functionBlock)
											direction: ( ( DhbVector new: result size)
															atAllPut: 0;
															at: n put: 1;
															yourself);
											yourself
									 ].