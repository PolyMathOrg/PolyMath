initialization
computeInitialValues
	unidimensionalFinder := PMOneVariableFunctionOptimizer forOptimizer: self.
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