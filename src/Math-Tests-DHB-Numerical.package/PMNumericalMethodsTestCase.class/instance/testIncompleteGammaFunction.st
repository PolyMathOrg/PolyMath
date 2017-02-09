iterative algorithms
testIncompleteGammaFunction
	| function |
	function := PMIncompleteGammaFunction shape: 2.
	self
		assert: ((function value: 2) - 0.59399414981) abs < 0.00000000001