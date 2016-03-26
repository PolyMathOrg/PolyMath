tests
testAccessing
	self assert: cm range equals: #(2 3).
	self assert: cm populationSize equals: 100.
	self deny: cm isFullyPopulated