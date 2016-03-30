checks
checkAM3
	^ self
		checkSolverClass: AM3Solver
		systemClass: ImplicitSystem
		stepperClass: AM3Stepper
		
	