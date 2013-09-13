as yet unclassified
checkAM4
	| solver stepper system |
	system := ImplicitSystem block: function.
      stepper := AM4Stepper onSystem: system.
	solver := (AM4Solver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime