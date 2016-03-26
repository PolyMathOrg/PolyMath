tests
testAccessing
	self assert: three eps equals: 1.
	self assert: three value equals: 3.
	self assert: three eps2 equals: 1.
	self assert: three eps1eps2 equals: 0.
	three eps1eps2: 2.
	three eps2: 2.
	self assert: three eps2 == 2.
	self assert: three eps1eps2 equals: 2