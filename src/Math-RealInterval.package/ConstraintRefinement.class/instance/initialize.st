initialization
initialize
super initialize .
	myDesiredPrec := self class defaultPrecision.
	desiredPrecision := 0.
	constraints := ConstraintsCollection new.
	fast := false.
