tests
testValue
	self assert: ((density value: 0.5) equalsTo: 0.1632610644).
	self
		assert: ((density value: #(0.5 1)) equalsTo: #(0.1632610644 0.28923996)).
	density epanechnikov.
	self assert: (density value: -0.4) equals: 0.
	self assert: ((density value: 0.5) equalsTo: 0.177824205).
	self assert: (density value: 5) equals: 0