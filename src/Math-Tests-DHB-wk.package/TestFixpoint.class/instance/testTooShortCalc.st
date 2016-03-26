tests
testTooShortCalc
	fp block: [ :x | 1 / (1 + x) ].
	fp value: 60.0.
	fp maximumIterations: 10.
	fp evaluate.
	self assert: fp cycle equals: #().
	self assert: fp cycleLength isNil.
	self assert: fp iterations equals: 10.
	self deny: fp hasConverged