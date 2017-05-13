comparing
testMatrixCloseToPrecision
	| a b |
	a := PMMatrix rows: #(#(1.2 2.4) #(1.2 2.4)).
	b := PMMatrix rows: #(#(1.4 2.2) #(1.4 2.2)).
	self assert: (a closeTo: b precision: 1.0).
	self deny: (a closeTo: b precision: 0.6).
	self deny: (a closeTo: b precision: 0.2)