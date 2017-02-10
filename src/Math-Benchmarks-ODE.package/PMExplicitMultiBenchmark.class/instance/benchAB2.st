benchmarking
benchAB2
	| solver stepper |
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]