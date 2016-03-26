function evaluation
testInterpolationNewtonLinear
	"Code example 3.1"

	| interpolator |
	interpolator := DhbNewtonInterpolator
		points: (Array with: 1 @ 2 with: 3 @ 1).
	self assert: ((interpolator value: 2.2) - 1.4) abs < 1.0e-14