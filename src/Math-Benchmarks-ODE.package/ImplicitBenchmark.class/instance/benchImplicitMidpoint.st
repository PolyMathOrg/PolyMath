benchmarking
benchImplicitMidpoint
	| solver stepper |
	stepper := ImplicitMidpointStepper onSystem: system.
	solver := (ImplicitMidpointSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]