as yet unclassified
checkRungeKutta
	| solver stepper system |
	system := ExplicitSystem block: function.
	stepper := RungeKuttaStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime