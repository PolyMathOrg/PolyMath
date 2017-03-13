linear algebra
testSymmetricMatrixAdd2
	| a b c |
	a := PMSymmetricMatrix rows: #(#(11 12 13) #(12 22 23) #(13 23 33)).
	b := PMSymmetricMatrix rows: #(#(1 2 3) #(2 1 7) #(3 7 0)).
	c := a + b.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 12.
	self assert: ((c rowAt: 1) at: 2) equals: 14.
	self assert: ((c rowAt: 1) at: 3) equals: 16