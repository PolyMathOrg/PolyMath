linear algebra
testMatrixExtensions
	"testing at:at: and at:at:put:"

	| a c |
	(RPackage organizer
		includesPackageNamed: 'Math-DHB-NumericalExtensions')
		ifFalse: [ ^ self skip ].
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	c := a deepCopy.
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 1).
	a at: 1 at: 1 put: 42.
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ]