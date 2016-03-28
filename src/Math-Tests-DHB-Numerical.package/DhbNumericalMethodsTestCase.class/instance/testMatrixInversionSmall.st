linear algebra
testMatrixInversionSmall
	| m c |
	m := DhbMatrix rows: #(#(3 2 4) #(2 -5 -1) #(1 -2 2)).
	c := m inverse * m.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 1.
	self assert: ((c rowAt: 1) at: 2) equals: 0.
	self assert: ((c rowAt: 1) at: 3) equals: 0.
	self assert: ((c rowAt: 2) at: 1) equals: 0.
	self assert: ((c rowAt: 2) at: 2) equals: 1.
	self assert: ((c rowAt: 2) at: 3) equals: 0.
	self assert: ((c rowAt: 3) at: 1) equals: 0.
	self assert: ((c rowAt: 3) at: 2) equals: 0.
	self assert: ((c rowAt: 3) at: 3) equals: 1