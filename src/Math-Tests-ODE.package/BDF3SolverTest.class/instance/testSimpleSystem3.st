tests-solving
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := BDF3Stepper onSystem: system.
	solver := BDF3Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 11.0227).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 2.5) closeTo: 219.4525).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 19.4318).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.8) closeTo: 73.5867)