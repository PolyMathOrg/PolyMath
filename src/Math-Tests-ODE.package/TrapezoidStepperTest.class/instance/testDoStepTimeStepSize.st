as yet unclassified
testDoStepTimeStepSize
	| stepper sys dt |
	sys := ImplicitSystem block: [:x :t |  t sin].
	stepper := ImplicitStepper onSystem: sys.
	dt := 0.1.
	self should: [(stepper doStep: 0 time: 10 stepSize: dt) = -0.05440211108893698 ].
	self should: [(stepper doStep: 10 time: 0 stepSize: dt) = 10.0 ].
	self should: [(stepper doStep: 1 time:  1 stepSize: dt) =1.0841470984807897].
	self should: [(stepper doStep: 10 time:  1 stepSize: dt) = 10.08414709848079].