tests
testXT
	| aBlock |
	aBlock := [ :x :t | t ].
	sys block: aBlock.
	self assert: (sys state: 1 time: 2) equals: 2.
	self assert: (sys state: 0 time: 2) equals: 2