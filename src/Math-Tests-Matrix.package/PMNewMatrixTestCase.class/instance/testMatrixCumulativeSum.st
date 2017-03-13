linear algebra
testMatrixCumulativeSum
	"Code Example 8.1"

	| a b |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	b := a cumsum.
	self assert: b numberOfRows equals: 2.
	self assert: b numberOfColumns equals: 3.
	self assert: ((b rowAt: 1) at: 1) equals: 1.
	self assert: ((b rowAt: 1) at: 2) equals: 1.
	self assert: ((b rowAt: 1) at: 3) equals: 2.
	self assert: ((b rowAt: 2) at: 1) equals: -1.
	self assert: ((b rowAt: 2) at: 2) equals: -3.
	self assert: ((b rowAt: 2) at: 3) equals: 0