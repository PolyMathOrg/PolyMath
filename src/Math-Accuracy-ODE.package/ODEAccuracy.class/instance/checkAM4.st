checks
checkAM4
	^ self
		checkSolverClass: AM4Solver
		systemClass: ImplicitSystem
		stepperClass: AM4Stepper