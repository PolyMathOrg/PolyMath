operation
randomizePopulation

	self reset.
	[self isFullyPopulated] 
		whileFalse: [population add: self randomChromosome]