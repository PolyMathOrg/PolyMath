arithmetic
testPolynomialDoubleDispatch1
	"there are a number of productFromType methods in polynomial with no senders."
	| p |
	p := DhbPolynomial coefficients: #(1 1 1 0 1).
	self should: [(p productFromInteger: 1) = p ].
	self shouldnt: [(p productFromInteger: 2) = p].
	self should: [((p productFromFraction: (1 / 2 )) at: 1) = ( 1 / 2)].