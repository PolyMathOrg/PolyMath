linear algebra
testVectorMatrixOperation
	| a u v |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	u := #(1 2 3) asPMVector.
	v := a * u.
	self assert: v size equals: 2.
	self assert: (v at: 1) equals: 4.
	self assert: (v at: 2) equals: 4