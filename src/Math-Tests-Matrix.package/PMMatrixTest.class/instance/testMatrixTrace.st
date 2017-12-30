linear algebra
testMatrixTrace
	| a |
	a := PMMatrix rows: #(#(1 2 3) #(4 5 6) #(7 8 9)).
	self assert: a tr equals: 15