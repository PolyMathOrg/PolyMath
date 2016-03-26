tests
testCalcErrorOfRealResult
	self assert: (a calcErrorOf: 0.7 realResult: 0.7) equals: 0.
	self assert: (a calcErrorOf: 0.7 realResult: 0.0) equals: -100.
	self assert: (a calcErrorOf: 1 / 4 realResult: 1 / 2) equals: 100.
	self
		assert: (a calcErrorOf: 0.0 realResult: 7)
		equals: Float infinity.
	self assert: (a calcErrorOf: 0.0 realResult: 0) equals: 0.
	self
		assert: (a calcErrorOf: 0.0 realResult: -1 / 7)
		equals: Float infinity negated