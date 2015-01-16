tests
testMaximumIterationsProbabilistic
	| r correct |
	fit := GeneralFunctionFit
		function: f
		data: col
		minimumValues: 0
		maximumValues: 5.
	correct := 0.
	fit populationSize: 20.
	7
		timesRepeat: [ 
			fit resetBestPoints.
			fit maximumIterations: 200.
			r := (fit evaluate - #(0.1 0.4)) abs.
			fit resetBestPoints.
			fit maximumIterations: 2.
			r := (fit evaluate - #(0.1 0.4)) abs - r.
			correct := ((r at: 1) > 0 or: [ (r at: 2) > 0 ])
				ifTrue: [ correct + 1 ]
				ifFalse: [ correct - 1 ] ].
	self assert: correct > 0