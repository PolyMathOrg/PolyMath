initialization
checkAB4
	| solver stepper system |
	system := ExplicitSystem block: function.
	stepper := AB4Stepper onSystem: system.
	solver := AB4Solver new stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime