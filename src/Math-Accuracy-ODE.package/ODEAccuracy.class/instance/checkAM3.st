as yet unclassified
checkAM3
	| solver stepper system |
	system := ImplicitSystem block: function.
      stepper := AM3Stepper onSystem: system.
	solver := (AM3Solver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime