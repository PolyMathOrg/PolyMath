linear algebra
testMatrixExtensions
	"testing at:at: and at:at:put:"
	| a c |
	(PackageInfo existPackageNamed: 'Math-DHB-NumericalExtensions') ifFalse:[^self skip].
	a := DhbMatrix rows: #( ( 1 0 1) (-1 -2 3)).
	c := a deepCopy .
	self should: [(c at: 1 at: 1) = (a at: 1 at: 1)].
	a at: 1 at: 1 put: 42.
	self shouldnt: [(c at: 1 at: 1 )= (a at: 1 at: 1)].