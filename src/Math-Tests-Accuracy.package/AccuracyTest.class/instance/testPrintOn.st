tests
testPrintOn
	| s |
	s := WriteStream on: String new.
	a printOn: s.
	self assert: s contents equals: 'an AccuracyTestExample ()'.
	s reset.
	a run.
	a printOn: s.
	self
		assert:
			(s contents
				beginsWith:
					'an AccuracyTestExample (
Report for: AccuracyTestExample')