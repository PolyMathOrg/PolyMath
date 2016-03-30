checks
checkTrapezoidAM2
	^ self
		checkSolverClass: ImplicitSolver
		systemClass: ImplicitSystem
		stepperClass: TrapezoidStepper