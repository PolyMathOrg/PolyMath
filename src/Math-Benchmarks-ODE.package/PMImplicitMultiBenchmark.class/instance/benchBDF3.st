benchmarking
benchBDF3
	| solver stepper |
	stepper := BDF3Stepper onSystem: system.
	solver := (BDF3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]