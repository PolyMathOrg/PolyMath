benchmarking
benchEuler
	|  solver stepper |
	stepper := ExplicitStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]