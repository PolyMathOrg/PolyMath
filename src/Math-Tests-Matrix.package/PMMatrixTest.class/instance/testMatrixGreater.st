comparing
testMatrixGreater
	| a b |
	a := PMMatrix rows: #(#(1 -1 2) #(-4 0 1)).
	b := a > 0.
	self assert: b numberOfRows equals: 2.
	self assert: b numberOfColumns equals: 3.
	self assert: ((b rowAt: 1) at: 1) equals: true.
	self assert: ((b rowAt: 1) at: 2) equals: false.
	self assert: ((b rowAt: 1) at: 3) equals: true.
	self assert: ((b rowAt: 2) at: 1) equals: false.
	self assert: ((b rowAt: 2) at: 2) equals: false.
	self assert: ((b rowAt: 2) at: 3) equals: true