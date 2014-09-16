tests
checkF2
|g origin optimizer r |
g:=[:x|  (x overlappingPairsCollect: [:f :s| (s - f squared)squared *100 + (1-f)squared])sum ].
r:=#(2 3 4) collect: [:i| 
	origin :=Array new: i withAll: -2.048.
	optimizer:= AnotherGeneticOptimizer function: g minimumValues: origin maximumValues: origin negated.
	self  setManager: optimizer chromosomeManager with: self parameter.
	fast ifTrue:[optimizer chromosomeManager populationSize: 60.	optimizer maximumIterations: 70].
	g value: optimizer evaluate. ].
^r.
