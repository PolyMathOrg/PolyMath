tests-solving
testSimpleSystem1
	| solver stepper system dt |
	dt := 0.025.
	system := ExplicitSystem block: [ :x :t | t tan + 1 ].
	stepper := MidpointStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.05) closeTo: 0.13237).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.09) closeTo: 0.2455).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.11) closeTo: 0.3048)