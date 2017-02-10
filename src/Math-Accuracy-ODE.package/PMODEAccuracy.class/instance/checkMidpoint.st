checks
checkMidpoint
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: MidpointStepper