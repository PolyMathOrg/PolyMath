tests
testIntegerDigits
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 0 base: 2)
		equals: #(0).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 1 base: 3)
		equals: #(1).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 12 base: 2)
		equals: #(1 1 0 0).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 12 base: 4)
		equals: #(3 0).
	self
		assert: (PMAnotherChromosomeManager integerDigitsFor: 49 base: 5)
		equals: #(1 4 4)