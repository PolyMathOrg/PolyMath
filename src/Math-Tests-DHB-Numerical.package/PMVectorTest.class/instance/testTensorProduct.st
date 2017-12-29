tests
testTensorProduct
	| a b c |
	a := #(1 2 3) asPMVector.
	b := #(2 2 3) asPMVector.
	c := a tensorProduct: b.
	self deny: c transpose = c.	"hence c is not symmetric, but this does not work:"
	self deny: c isSymmetric.
	"furthermore this is completely permissible:"
	b := #(1 2 3 4) asPMVector.
	c := a tensorProduct: b.
	self assert: (b tensorProduct: a) equals: c transpose