tests
checkGriewank
	| g origin range optimizer |
	g := [ :x | x squared sum / 4000 - ((x withIndexCollect: [ :xi :i | (xi / i sqrt) cos ]) reduce: [ :a :b | a * b ]) + 1 ].
	origin := #(-600 -600).
	range := #(600 600).
	optimizer := PMAnotherGeneticOptimizer function: g minimumValues: origin maximumValues: range.
	self setManager: optimizer chromosomeManager with: self parameter.
	fast
		ifFalse: [ optimizer maximumIterations: 350 ].
	^ g value: optimizer evaluate