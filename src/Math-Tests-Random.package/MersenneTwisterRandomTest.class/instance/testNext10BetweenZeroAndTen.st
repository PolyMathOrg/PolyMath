tests
testNext10BetweenZeroAndTen
	| g |
	g := PMMersenneTwisterRandomGenerator new.
	1000
		timesRepeat: [ | value |
			value := g next.
			self assert: value > 0.
			self assert: value < 10 ]