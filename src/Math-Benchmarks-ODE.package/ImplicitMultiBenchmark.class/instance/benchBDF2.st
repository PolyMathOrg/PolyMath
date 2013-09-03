benchmarking
benchBDF2
	| solver stepper |
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	solver solve: system startState: startState startTime:startTime endTime: endTime