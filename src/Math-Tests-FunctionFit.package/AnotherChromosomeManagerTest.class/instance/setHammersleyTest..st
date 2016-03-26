running
setHammersleyTest: aBoolean
	cm useHammersley: aBoolean.
	cm randomizePopulation.
	self assert: cm isFullyPopulated.
	self assert: (cm population anySatisfy: [ :g | g first > 1 ]).
	self assert: (cm population anySatisfy: [ :g | g first < 1 ]).
	self assert: (cm population anySatisfy: [ :g | g second < 2 ]).
	self assert: (cm population anySatisfy: [ :g | g second > 3 ]).
	cm population
		do: [ :i | 
			self assert: i size equals: 2.
			self assert: (i first between: 0 and: 2).
			self assert: (i second between: 1 and: 4) ]