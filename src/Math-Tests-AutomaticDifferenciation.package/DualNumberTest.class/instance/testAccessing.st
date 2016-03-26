tests
testAccessing
	self assert: three eps equals: 1.
	self assert: three value equals: 3.
	three value: 2.
	three eps: 2.
	self assert: three eps equals: 2.
	self assert: three value equals: 2