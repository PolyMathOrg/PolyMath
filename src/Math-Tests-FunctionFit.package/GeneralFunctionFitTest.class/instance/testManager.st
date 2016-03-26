tests
testManager
	fit := GeneralFunctionFit
		function: f
		data: col
		minimumValues: 0
		maximumValues: 5.
	self assert: fit manager class equals: AnotherChromosomeManager.
	self assert: fit manager range equals: #(5 5)