benchmarking
benchTrapezoidAM2
	| solver stepper |
	stepper := TrapezoidStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]