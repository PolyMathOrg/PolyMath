initialization
checkBDF3
	| solver stepper system |
	system := ImplicitSystem block: function.
   stepper := BDF3Stepper onSystem: system.
	solver := BDF3Solver new stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime