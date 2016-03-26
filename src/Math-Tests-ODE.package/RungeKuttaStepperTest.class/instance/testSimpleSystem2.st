tests-stepping
testSimpleSystem2
	| solver stepper system dt |
	dt := 1.5.
	system := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := RungeKuttaStepper onSystem: system.
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
				endTime: 1.5) closeTo: 4.3646).
	self
		should:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 0.5951)