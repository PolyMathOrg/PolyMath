linear algebra
testVectorMatrixOperation
	"Code Example 8.1"
	| a u v |
	a := DhbMatrix rows: #( ( 1 0 1) (-1 -2 3)).
	u := #(1 2 3) asVector.
	v := a * u.
	self should: [ v size = 2].
	self should: [ (v at: 1) = 4].
	self should: [ (v at: 2) = 4].