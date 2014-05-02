linear algebra
testMatrixExtensionsAtRow
	"testing at:at: and at:at:put:"
	| a c |
	(PackageInfo existPackageNamed: 'Math-DHB-NumericalExtensions') ifFalse:[^self skip].
	a := DhbMatrix rows: #( ( 11 12 13) (21 22 23)).
	c := a deepCopy .
	self should: [(c at: 1 at: 1) = (a at: 1 at: 1)].
	c atRow: 1 put: (a rowAt: 2).
	self shouldnt: [(c at: 1 at: 1 )= (a at: 1 at: 1)].
	self should: [(c at: 1 at: 1) = (a at: 2 at: 1)].
	c := a deepCopy .
	c atRow: 1 put: (a rowAt: 2) startingAt: 1. 

	self should: [(c at: 1 at: 2 ) = (a at: 2 at: 1) ].
	self shouldnt: [(c at: 1 at: 2) = (a at: 1 at: 2)].