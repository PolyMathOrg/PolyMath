operation
computeInitialValues
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "
	self range notNil
		ifTrue: [ self performGeneticOptimization].
	self performSimplexOptimization.