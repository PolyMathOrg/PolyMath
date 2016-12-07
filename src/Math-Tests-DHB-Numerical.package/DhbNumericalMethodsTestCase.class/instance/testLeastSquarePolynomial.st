estimation
testLeastSquarePolynomial
	"Code example 10.5"

	| fit estimation |
	fit := PMPolynomialLeastSquareFit new: 3.
	fit
		add: (DhbWeightedPoint point: 1 @ 2.0);
		add: (DhbWeightedPoint point: 2 @ 21.0);
		add: (DhbWeightedPoint point: 3 @ 72.0);
		add: (DhbWeightedPoint point: 4 @ 173.0);
		add: (DhbWeightedPoint point: 5 @ 342.0);
		add: (DhbWeightedPoint point: 6 @ 597.0);
		add: (DhbWeightedPoint point: 7 @ 956.0);
		add: (DhbWeightedPoint point: 8 @ 1437.0);
		add: (DhbWeightedPoint point: 9 @ 2058.0);
		add: (DhbWeightedPoint point: 10 @ 2837.0).
	estimation := fit evaluate.
	self assert: ((estimation value: 4.5) - 247.875) abs < 0.000000001.
	self assert: ((estimation error: 4.5) - 5.215298e-1) abs < 0.00001.
	self
		assert:
			((estimation value: 7.15) - 1019.932625) abs
				< (estimation error: 7.15)