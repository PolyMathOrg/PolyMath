tests
testAddScalar
	| u |
	u := #(1 2 3) asPMVector.
	self assert: u + 2 equals: #(3 4 5) asPMVector.
	self assert: 2 + u equals: #(3 4 5) asPMVector.