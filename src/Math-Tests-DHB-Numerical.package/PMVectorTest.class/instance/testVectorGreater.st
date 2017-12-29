tests
testVectorGreater

| u w |
	u := #(-1 0 1) asPMVector.
	w := u > 0.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: false.
	self assert: (w at: 2) equals: false.
	self assert: (w at: 3) equals: true
