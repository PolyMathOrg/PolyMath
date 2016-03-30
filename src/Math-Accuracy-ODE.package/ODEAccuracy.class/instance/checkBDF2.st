checks
checkBDF2
	^ self
		checkSolverClass: BDF2Solver
		systemClass: ImplicitSystem
		stepperClass: BDF2Stepper