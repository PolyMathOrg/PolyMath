operation
computeInitialValues
	"Computes initial values as (1, g(1), 0, g(0))"
	extendedResult at: 1 put: 1.0.
	extendedResult at: 2 put: (boundaryValues at: 3).
	extendedResult at: 3 put: 0.0.
	extendedResult at: 4 put: (boundaryValues at: 1).
	useCubicApproximation := false.
	result := 1.0.