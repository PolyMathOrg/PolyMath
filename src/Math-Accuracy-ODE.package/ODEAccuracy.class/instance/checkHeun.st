checks
checkHeun
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: HeunStepper