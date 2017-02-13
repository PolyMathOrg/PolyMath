tests
checkF1
	| f origin optimizer |
	f := [ :x | 
	| v |
	v := x asPMVector.
	v * v ].
	origin := Array new: self argument first withAll: -5.
	optimizer := PMAnotherGeneticOptimizer function: f minimumValues: origin maximumValues: origin negated.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifTrue: [ 
			optimizer chromosomeManager populationSize: 50.
			optimizer maximumIterations: 50 ].
	^ f value: optimizer evaluate