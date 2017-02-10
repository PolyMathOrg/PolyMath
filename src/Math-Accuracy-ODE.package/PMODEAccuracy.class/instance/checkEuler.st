checks
checkEuler
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: ExplicitStepper