checks
checkRungeKutta
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: RungeKuttaStepper