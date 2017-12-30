linear algebra
testMatrixAddSizeMismatch
	| a b |
	"Matrices of different dimensions should signal SizeMismatch on #+."
	a := PMMatrix rows: #(#(1 2) #(3 4)).
	b := PMMatrix rows: #(#(1 2)).
	self should: [ a + b ] raise: SizeMismatch.
	self should: [ b + a ] raise: SizeMismatch.
	self should: [ a + b transpose ] raise: SizeMismatch.
	self should: [ b transpose + a ] raise: SizeMismatch