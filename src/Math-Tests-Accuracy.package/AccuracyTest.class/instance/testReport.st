tests
testReport
	self assert: a report equals: ''.
	a run.
	self assert: (a report beginsWith: 'Report for: AccuracyTestExample')