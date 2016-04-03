linear algebra
testMatrixSubtract
	| a b c |
	a := DhbMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	b := DhbMatrix rows: #(#(1 2 3) #(-2 1 7)).
	c := a - b.
	self assert: c numberOfRows equals: 2.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 0.
	self assert: ((c rowAt: 1) at: 2) equals: -2.
	self assert: ((c rowAt: 1) at: 3) equals: -2.
	self assert: ((c rowAt: 2) at: 1) equals: 1.
	self assert: ((c rowAt: 2) at: 2) equals: -3.
	self assert: ((c rowAt: 2) at: 3) equals: -4