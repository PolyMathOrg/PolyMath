tests
testChromosomeManager
	self
		assert: go chromosomeManager class
		equals: AnotherChromosomeManager.
	self assert: go chromosomeManager populationSize equals: 20