linear algebra
testMatrixExtensionsAtColumn
	"testing at:at: and at:at:put:"

	| a c |

	a := PMMatrix rows: #(#(11 12 13) #(21 22 23)).
	c := a deepCopy.
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 1).
	c atColumn: 1 put: (a atColumn: 2).
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ].
	self assert: (c at: 1 at: 1) equals: (a at: 1 at: 2).
	c := a deepCopy.
	c at: 1 at: 1 put: (a at: 1 at: 2).
	c atColumn: 1 put: (a atColumn: 2) startingAt: 1.
	self assert: (c at: 2 at: 1) equals: (a at: 1 at: 2).
	self shouldnt: [ (c at: 1 at: 1) = (a at: 1 at: 1) ]