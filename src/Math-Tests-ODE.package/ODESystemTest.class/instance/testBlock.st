tests
testBlock
	| aBlock |
	aBlock := [ :x :t | t ].
	sys block: aBlock.
	self assert: sys block equals: aBlock