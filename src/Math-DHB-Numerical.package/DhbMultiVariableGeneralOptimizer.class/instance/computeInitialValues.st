operation
computeInitialValues
	self range notNil
		ifTrue: [ self performGeneticOptimization].
	self performSimplexOptimization