tests
testVectorNegate
	"negate modifies the vector. negated makes a new vector with inverse coefficients. "

	| v |
	v := #(1 2 3) asPMVector.
	self assert: (v negate at: 1) equals: -1.
	self assert: 2 equals: (v negate at: 2).
	self assert: -2 equals: (v negated at: 2)