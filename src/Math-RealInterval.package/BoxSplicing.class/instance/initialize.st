initialization
initialize

	super initialize.
	constraints := ConstraintsCollection new.
	self maximumIterations: 52. "use complete precision of floats"
