tests-stepping
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := AB3Stepper onSystem: system.
	solver := AB3Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.5) closeTo: 1.25).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1) closeTo: 2.4219).
	self
		assert:
			((solver
				solve: system
				startState: 2.4219
				startTime: 0.5
				endTime: 1) closeTo: 4.6924)