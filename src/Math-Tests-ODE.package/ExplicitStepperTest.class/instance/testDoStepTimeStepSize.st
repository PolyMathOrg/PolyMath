tests-stepping
testDoStepTimeStepSize
	| stepper sys dt |
	sys := ExplicitSystem block: [:x :t | x * t].
	stepper := ExplicitStepper onSystem: sys.
	dt := 0.1.
	self should: [(stepper doStep: 0 time: 10 stepSize: dt) = 0 ].
	self should: [(stepper doStep: 10 time: 0 stepSize: dt) = 10 ].
	self should: [(stepper doStep: 1 time:  1 stepSize: dt) = 1.1].
	self should: [(stepper doStep: 10 time:  1 stepSize: dt) = 11.0].