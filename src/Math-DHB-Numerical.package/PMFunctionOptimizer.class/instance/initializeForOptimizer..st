initialization
initializeForOptimizer: aFunctionOptimizer
		"Private"
	optimizingPointClass := aFunctionOptimizer pointClass.
	functionBlock := aFunctionOptimizer functionBlock.
	^self initialize