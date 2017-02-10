operation
performGeneticOptimization
		"Private"
	| optimizer manager |
	optimizer := PMGeneticOptimizer forOptimizer: self.
	manager := PMVectorChromosomeManager new: 100 mutation: 0.1 crossover: 0.1.
	manager origin: self origin asPMVector; range: self range asPMVector.
	optimizer chromosomeManager: manager.
	result := optimizer evaluate.