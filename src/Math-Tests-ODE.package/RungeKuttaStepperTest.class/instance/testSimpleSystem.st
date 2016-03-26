tests-stepping
testSimpleSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [ :x :t | t sin ].
	stepper := RungeKuttaStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: -1
				startTime: 0
				endTime: Float pi) closeTo: 1)