checks
checkImplicitMidpoint
	^ self
		checkSolverClass: ImplicitMidpointSolver
		systemClass: ImplicitSystem
		stepperClass: ImplicitMidpointStepper