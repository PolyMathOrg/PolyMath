arithmetic
testVectorNegate
	"negate modifies the vector. negated makes a new vector with inverse coefficients. "
	| v |
	v := #(1 2 3) asVector .
	self should: [(v negate at: 1)= -1].
	self should: [2 = (v negate at: 2)].
	self should: [-2 = (v negated at: 2)].