as yet unclassified
computeInitialValues
	extendedResult at: 1 put: 1.0.
	extendedResult at: 2 put: (boundaryValues at: 3).
	extendedResult at: 3 put: 0.0.
	extendedResult at: 4 put: (boundaryValues at: 1).
	result := 1.0.