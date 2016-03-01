checks
checkSolverClass: solverClass systemClass: systemClass stepperClass: stepperClass
	| solver stepper system |
	system := systemClass block: function.
	stepper := stepperClass onSystem: system.
	solver := solverClass new stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime