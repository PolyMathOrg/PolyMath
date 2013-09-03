benchmarking
benchAM4
	| solver stepper |
	stepper := AM4Stepper onSystem: system.
	solver := (AM4Solver new) stepper: stepper; system: system; dt: dt.
	solver solve: system startState: startState startTime:startTime endTime: endTime