tests
testNextBetweenZeroAndOne
	| g |
	g := LehmerRandom new.
	1000 timesRepeat:
		[ self should: [g next > 0].
		self should: [g next < 1]].