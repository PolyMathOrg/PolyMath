benchmarking
benchMidpoint
	| solver stepper |
	stepper := MidpointStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	solver solve: system startState: startState startTime:startTime endTime: endTime