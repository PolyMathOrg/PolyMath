initialization
checkBDF2
	| solver stepper system |
	system := ImplicitSystem block: function.
   stepper := BDF2Stepper onSystem: system.
	solver := BDF2Solver new stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime