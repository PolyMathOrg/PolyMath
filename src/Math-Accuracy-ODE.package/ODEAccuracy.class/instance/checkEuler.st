as yet unclassified
checkEuler
	|  solver stepper system |
	system := ExplicitSystem block: function.
	stepper := ExplicitStepper onSystem:  system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime