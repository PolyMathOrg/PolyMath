tests
testNext10BetweenZeroAndTen
	| g |
	g := MersenneTwisterRandom new.
	1000 timesRepeat:
		[ | value |
		value := g next.
		 self should: [value > 0].
		self should: [value < 10]].