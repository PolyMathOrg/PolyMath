operation
buildInitialSimplex
	"Private"

	| projectedFunction finder partialResult |
	projectedFunction := PMProjectedOneVariableFunction 
				function: functionBlock.
	finder := PMOneVariableFunctionOptimizer forOptimizer: self.
	finder setFunction: projectedFunction.
	[bestPoints size < (result size + 1)] whileTrue: 
			[projectedFunction
				setArgument: result;
				bumpIndex.
			partialResult := finder
						reset;
						evaluate.
			bestPoints add: (optimizingPointClass 
						vector: (projectedFunction argumentWith: partialResult)
						function: functionBlock)]