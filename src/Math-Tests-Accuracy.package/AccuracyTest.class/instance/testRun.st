tests
testRun
	a run.
	a run: 'Bbb'.
	self assert: (a dataTree atPath: #('names' 'data')) equals: #('Bbb').
	self
		assert:
			(a report
				beginsWith:
					'Report for: AccuracyTestExample
test Bbb').
	a run: #('Ccc' 'Eee').
	self
		assert: (a dataTree atPath: #('names' 'data'))
		equals: #('Ccc' 'Eee')