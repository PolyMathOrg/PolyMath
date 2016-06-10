operation
performGeneticOptimization
		"Private"
	| optimizer manager |
	optimizer := DhbGeneticOptimizer forOptimizer: self.
	manager := DhbVectorChromosomeManager new: 100 mutation: 0.1 crossover: 0.1.
	manager origin: self origin asDhbVector; range: self range asDhbVector.
	optimizer chromosomeManager: manager.
	result := optimizer evaluate.