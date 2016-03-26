tests
testVectorXT
	"a simple example of using a collection as state"

	| aBlock |
	aBlock := [ :x :t | x collect: [ :ea | t ] ].
	sys block: aBlock.
	self assert: (sys state: #(1 2 3) time: 2) equals: #(2 2 2).
	self assert: (sys state: #(0 0) time: 2) equals: #(2 2)