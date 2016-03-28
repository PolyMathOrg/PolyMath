initialization
initialize
	super initialize.
	alpha := 1e-4.
	failingMin := 1e-3.
	useCubicApproximation := false.
	" Values for g(0), g'(0) and g(1) "
	boundaryValues := FloatArray new: 3.
	" Result: x1, g(x1), x2, g(x2) "
	extendedResult := FloatArray new: 4.
	^ self