linear algebra
testAtRowPutAtColumnPut
	| a |
	a := PMMatrix rows: #(#(11 12 13) #(21 22 23)).
	a atRow: 1 put: (a rowAt: 2).
	self assert: a equals: (PMMatrix rows: #(#(21 22 23) #(21 22 23))).
	a atColumn: 3 put: (a columnAt: 2).
	self assert: a equals: (PMMatrix rows: #(#(21 22 22) #(21 22 22))).
	a := PMSymmetricMatrix rows: #(#(11 12) #(21 22)).
	self should: [ a atRow: 1 put: (a rowAt: 2) ] raise: Error.
	self should: [ a atColumn: 1 put: (a rowAt: 2) ] raise: Error