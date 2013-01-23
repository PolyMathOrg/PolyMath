function evaluation
testInterpolationSpline

	| interpolator |
	interpolator := DhbSplineInterpolator new.
	1 to: 45 by: 2 do:
		[ :x | interpolator add: x @ (x degreesToRadians sin)].
	self should: [ ((interpolator value: 8) - (8 degreesToRadians sin)) abs < 1.0e-7].