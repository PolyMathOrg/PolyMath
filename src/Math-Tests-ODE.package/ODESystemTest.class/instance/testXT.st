tests
testXT
	| aBlock |
	aBlock := [:x : t | t].
	sys block: aBlock.
	self should: [(sys x: 1 t: 2 ) = 2].
	self should: [(sys x: 0 t: 2) = 2].
