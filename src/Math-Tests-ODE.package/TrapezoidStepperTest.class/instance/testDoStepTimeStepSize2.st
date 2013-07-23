as yet unclassified
testDoStepTimeStepSize2
	| stepper sys dt |
	sys := ImplicitSystem block: [:x :t | 3 * t negated exp - (0.4 * x)].
	stepper := ImplicitStepper onSystem: sys.
	dt := 0.1.
	self should: [(stepper doStep: 1 time:  1 stepSize: dt) = 1.0703638323514326].
	self should: [(stepper doStep: 10 time:  1 stepSize: dt) = 9.710363832351433].