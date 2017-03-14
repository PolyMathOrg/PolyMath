function evaluation
testInterpolationLagrangeLinear

	| interpolator |
	interpolator := PMLagrangeInterpolator
		points: (Array with: 1 @ 2 with: 3 @ 1).
	self assert: ((interpolator value: 2.2) - 1.4) abs < 1.0e-14