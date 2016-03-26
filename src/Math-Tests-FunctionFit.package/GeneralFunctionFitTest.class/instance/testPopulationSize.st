tests
testPopulationSize
	fit := GeneralFunctionFit
		function: f
		data: col
		minimumValues: 0
		maximumValues: 5.
	self assert: fit manager populationSize equals: 50.
	fit populationSize: 100.
	self assert: fit manager populationSize equals: 100