as yet unclassified
testDoStepTime1
	"this is identical to testDoStepTimeStepSize except dt is stored."
	| stepper sys dt |
	sys := ImplicitSystem block: [:x :t | 3 * t negated exp - (0.4 * x)].
	stepper := ImplicitStepper onSystem: sys.
	dt := 0.1.
	stepper stepSize: dt.
	self should: [stepper stepSize = dt].
	self should: [(stepper doStep: 0 time: 10) = 1.3619978928745448e-5 ].
	self should: [(stepper doStep: 10 time: 0 stepSize: 1) = 9.0 ].

	"stepSize parameter changes the stored stepSize"

	self should: [(stepper doStep: 5 time:  0 stepSize: 1.5) = 6.5].