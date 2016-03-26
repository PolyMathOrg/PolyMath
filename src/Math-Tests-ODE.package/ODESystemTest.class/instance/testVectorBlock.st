tests
testVectorBlock
	"this illustrates using a block that operates on a collection"

	| aBlock |
	aBlock := [ :x :t | x collect: [ :ea | t ] ].
	sys block: aBlock.
	self assert: sys block equals: aBlock