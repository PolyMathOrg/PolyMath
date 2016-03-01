tests
checkF5
	| g origin optimizer |
	g := [ :x | 
	| x1 x2 |
	x1 := x at: 1.
	x2 := x at: 2.
	1
		/
			(((-2 to: 2)
				collect: [ :i | 
					((-2 to: 2)
						collect: [ :j | 1 / ((i + 2) * 5 + j + 3 + (x1 - (16 * j) raisedToInteger: 6) + (x2 - (16 * i) raisedToInteger: 6)) ])
						sum ]) sum + 0.002) ].
	origin := #(-65.536 -65.536).
	optimizer := AnotherGeneticOptimizer function: g minimumValues: origin maximumValues: origin negated.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifTrue: [ optimizer maximumIterations: 70 ].
	^ g value: optimizer evaluate