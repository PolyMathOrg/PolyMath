checks
checkBDF4
	^ self
		checkSolverClass: BDF4Solver
		systemClass: ImplicitSystem
		stepperClass: BDF4Stepper