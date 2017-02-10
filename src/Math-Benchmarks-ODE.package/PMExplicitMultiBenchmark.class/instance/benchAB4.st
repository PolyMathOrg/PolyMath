benchmarking
benchAB4
	| solver stepper |
	stepper := AB4Stepper onSystem: system.
	solver := (AB4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]