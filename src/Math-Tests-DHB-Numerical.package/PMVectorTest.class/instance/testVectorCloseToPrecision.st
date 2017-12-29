tests
testVectorCloseToPrecision
	| u v |
	u := #(1.2 2.4) asPMVector.
	v := #(1.4 2.2) asPMVector.
	self assert: (u closeTo: v precision: 0.5).
	self deny: (u closeTo: v precision: 0.3).
	self deny: (u closeTo: v precision: 0.1).