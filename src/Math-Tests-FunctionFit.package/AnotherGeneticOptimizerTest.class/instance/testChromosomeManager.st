tests
testChromosomeManager
	self
		assert: go chromosomeManager class
		equals: PMAnotherChromosomeManager.
	self assert: go chromosomeManager populationSize equals: 20