linear algebra
testMatrixDo
	| a |
	a := PMMatrix rows: #(#(1 2 3) #(1 2 3) #(1 2 3)).
	a rowsDo: [ :row | row at: 1 put: 0 ].
	self assert: (a rowAt: 1 columnAt: 1) equals: 0.
	a columnsDo: [ :col | a atRow: 1 put: col ].
	self assert: (a rowAt: 1) equals: #(2 3 3) asPMVector