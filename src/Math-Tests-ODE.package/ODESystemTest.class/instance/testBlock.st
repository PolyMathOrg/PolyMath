tests
testBlock
	| aBlock |
	aBlock := [:x : t | t].
	sys block: aBlock.
	self should: [sys block = aBlock].