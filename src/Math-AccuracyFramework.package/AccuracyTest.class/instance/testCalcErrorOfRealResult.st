tests
testCalcErrorOfRealResult
	self assert: (a calcErrorOf: 0.7 realResult:0.7 ) = 0.
	self assert: (a calcErrorOf: 0.7 realResult:0.0 ) = -100 .
	self assert: (a calcErrorOf: 1/4 realResult:1/2 ) = 100.
	self assert: (a calcErrorOf: 0.0 realResult:7 ) = Float infinity.
	self assert: (a calcErrorOf: 0.0 realResult:0 ) = 0.
	self assert: (a calcErrorOf: 0.0 realResult:(-1/7) ) = Float infinity negated.

