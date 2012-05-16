operation
buildInitialSimplex
	"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "

	| projectedFunction finder partialResult |
	projectedFunction := DhbProjectedOneVariableFunction 
				function: functionBlock.
	finder := DhbOneVariableFunctionOptimizer forOptimizer: self.
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