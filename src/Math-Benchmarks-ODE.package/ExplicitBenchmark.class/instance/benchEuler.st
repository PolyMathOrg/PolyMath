benchmarking
benchEuler
	|  solver stepper |
	stepper := ExplicitStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	solver solve: system startState: startState startTime:startTime endTime: endTime