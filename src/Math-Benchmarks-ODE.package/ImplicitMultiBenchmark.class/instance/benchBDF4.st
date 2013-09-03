benchmarking
benchBDF4
	| solver stepper |
	stepper := BDF4Stepper onSystem: system.
	solver := (BDF4Solver new) stepper: stepper; system: system; dt: dt.
	solver solve: system startState: startState startTime:startTime endTime: endTime