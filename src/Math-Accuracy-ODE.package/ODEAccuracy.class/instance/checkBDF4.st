initialization
checkBDF4
	| solver stepper system |
	system := ImplicitSystem block: function.
   stepper := BDF4Stepper onSystem: system.
	solver := BDF4Solver new stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime