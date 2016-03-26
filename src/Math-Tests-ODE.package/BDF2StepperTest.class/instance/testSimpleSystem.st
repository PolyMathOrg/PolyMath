tests-stepping
testSimpleSystem
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem block: [ :x :t | t sin ].
	stepper := BDF2Stepper onSystem: system.
	solver := BDF2Solver new
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