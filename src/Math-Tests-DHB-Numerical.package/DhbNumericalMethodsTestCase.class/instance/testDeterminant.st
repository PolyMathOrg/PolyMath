linear algebra
testDeterminant
	| m |
	m := DhbMatrix rows: #(#(3 2 4) #(2 -5 -1) #(1 -2 2)).
	self assert: m determinant equals: -42