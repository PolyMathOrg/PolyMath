tests-solving
testSimpleSystem3
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := TrapezoidStepper onSystem: system.
	solver := ImplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.2) closeTo: 1.11).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 11.0742).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1.5) closeTo: 10.5468).
	self
		assert:
			((solver
				solve: system
				startState: 0.1
				startTime: 1
				endTime: 2.5) closeTo: 20.6718)