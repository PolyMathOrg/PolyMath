tests
testManager
	fit := PMGeneralFunctionFit
		function: f
		data: col
		minimumValues: 0
		maximumValues: 5.
	self assert: fit manager class equals: PMAnotherChromosomeManager.
	self assert: fit manager range equals: #(5 5)