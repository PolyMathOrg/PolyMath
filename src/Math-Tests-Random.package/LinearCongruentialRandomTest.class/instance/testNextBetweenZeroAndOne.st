tests
testNextBetweenZeroAndOne
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	1000
		timesRepeat: [ self assert: g next >= 0.
			self assert: g next <= 1 ]