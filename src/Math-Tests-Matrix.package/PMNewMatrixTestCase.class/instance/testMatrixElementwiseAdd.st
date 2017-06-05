linear algebra
testMatrixElementwiseAdd
	| a b |
	a := PMMatrix rows: #(#(1 2) #(3 4)).
	b := PMMatrix rows: #(#(2 3) #(4 5)).
	self assert: a + 0 equals: a.
	self assert: 0 + a equals: a.
	self assert: a + 1 equals: b.
	self assert: 1 + a equals: b.
	self assert: -1 + b equals: a.
	self assert: b + -1 equals: a.