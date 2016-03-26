tests-solving
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := AM3Stepper onSystem: system.
	solver := AM3Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 9.7551).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1.5) closeTo: 9.7298).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 0).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 2.5) closeTo: 415.6194)