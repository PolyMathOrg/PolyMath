tests
testNextBetweenZeroAndOne
	| g |
	g := LCRandom new.
	1000 timesRepeat:
		[ self should: [g next >= 0].
		self should: [g next <= 1]].