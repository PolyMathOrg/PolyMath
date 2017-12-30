comparing
testMatrixHash
	| a b c |
	a := PMMatrix rows: #(#(1 0) #(0 1)).
	b := a deepCopy.
	self assert: a hash equals: b hash.
	c := a + b.
	self shouldnt: [ a hash = c hash ]