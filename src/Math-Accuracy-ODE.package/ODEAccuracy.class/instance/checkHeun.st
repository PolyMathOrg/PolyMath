as yet unclassified
checkHeun
	| solver stepper system |
	system := ExplicitSystem block: function.
	stepper := HeunStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime