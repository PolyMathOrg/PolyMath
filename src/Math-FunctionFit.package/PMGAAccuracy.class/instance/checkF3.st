tests
checkF3
	| g origin optimizer |
	g := [ :x | (x floor + 0.5) squared sum ].
	origin := Array new: self argument first withAll: -5.
	optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: origin negated.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifTrue: [ 
			optimizer chromosomeManager populationSize: 20.
			optimizer maximumIterations: 70 ]
		ifFalse: [ 
			optimizer chromosomeManager populationSize: 30.
			optimizer maximumIterations: 90 ].
	^ g value: optimizer evaluate