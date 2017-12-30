linear algebra
testDimension
	| a |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	self assert: a dimension equals: 2 @ 3