tests-stepping
testSimpleSystem2
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := HeunStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 5
				startTime: 0
				endTime: 0.5) closeTo: 5.15489).
	self
		should:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.5) closeTo: 0.3881)