tests
testOnesMatrix
	| a |
	a := PMMatrix onesRows: 2 cols: 3.
	self assert: a numberOfRows equals: 2.
	self assert: a numberOfColumns equals: 3.
	self assert: ((a rowAt: 1) at: 1) equals: 1.
	self assert: ((a rowAt: 1) at: 2) equals: 1.
	self assert: ((a rowAt: 1) at: 3) equals: 1.
	self assert: ((a rowAt: 2) at: 1) equals: 1.
	self assert: ((a rowAt: 2) at: 2) equals: 1.
	self assert: ((a rowAt: 2) at: 3) equals: 1