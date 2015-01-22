tests
testLog
	self assert: ((Float e + 0 i) log: Float e) = Float e ln. "See Bug 1815 on Mantis"
	self should: [((2 + 0 i ) log: 2) = 1].