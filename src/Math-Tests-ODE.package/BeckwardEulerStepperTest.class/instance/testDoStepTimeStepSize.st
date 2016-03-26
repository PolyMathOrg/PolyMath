tests-stepping
testDoStepTimeStepSize
	| stepper sys dt |
	sys := ImplicitSystem block: [ :x :t | x * t ].
	stepper := ImplicitStepper onSystem: sys.
	dt := 0.1.
	self assert: (stepper doStep: 0 time: 10 stepSize: dt) equals: 0.101.
	self assert: (stepper doStep: 10 time: 0 stepSize: dt) equals: 10.101.
	self assert: (stepper doStep: 1 time: 1 stepSize: dt) equals: 1.121.
	self assert: (stepper doStep: 10 time: 1 stepSize: dt) equals: 11.111