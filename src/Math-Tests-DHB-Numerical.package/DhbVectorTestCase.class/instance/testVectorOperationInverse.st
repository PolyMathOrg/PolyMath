linear algebra
testVectorOperationInverse

	| u v w |
	u := #(1 2 3) asDhbVector.
	v := #(3 4 5) asDhbVector.
	w := v * 4 - (3 * u).
	self should: [ w size = 3].
	self should: [ (w at: 1) = 9].
	self should: [ (w at: 2) = 10].
	self should: [ (w at: 3) = 11].