linear algebra
testScalarProductIsCommutative
	| u v |
	u := DhbVector new: 3.
	v := DhbVector new: 3.
	u at: 1 put: 1; at: 2 put: 1; at: 3 put: 1.
	v at: 1 put: 0; at: 2 put: 2; at: 3 put: 0.
	self should: [(u scalarProduct: v ) = (v scalarProduct: u)].
