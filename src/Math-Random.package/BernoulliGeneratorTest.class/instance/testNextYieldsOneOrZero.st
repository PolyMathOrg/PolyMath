tests
testNextYieldsOneOrZero
	| gen |
	gen := BernoulliGenerator fair.
	self should: [ | x | x := gen next.
				(x = 0) or: [x = 1]].