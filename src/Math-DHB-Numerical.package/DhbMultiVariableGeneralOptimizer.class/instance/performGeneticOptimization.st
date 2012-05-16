operation
performGeneticOptimization
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/29/00 "
	| optimizer manager |
	optimizer := DhbGeneticOptimizer forOptimizer: self.
	manager := DhbVectorChromosomeManager new: 100 mutation: 0.1 crossover: 0.1.
	manager origin: self origin asVector; range: self range asVector.
	optimizer chromosomeManager: manager.
	result := optimizer evaluate.