tests-stepping
testDoStepTimeStepSize2
	| stepper sys dt |
	sys := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := RungeKuttaStepper onSystem: sys.
	dt := 0.1.
	self
		assert: ((stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.0638).
	self
		assert: ((stepper doStep: 10 time: 1 stepSize: dt) closeTo: 9.7109)