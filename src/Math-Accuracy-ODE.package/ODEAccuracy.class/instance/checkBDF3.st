checks
checkBDF3
	^ self
		checkSolverClass: BDF3Solver
		systemClass: ImplicitSystem
		stepperClass: BDF3Stepper