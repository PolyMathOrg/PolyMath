tests-stepping
testDoStepTime
	"this is identical to testDoStepTimeStepSize except dt is stored."

	| stepper sys dt |
	sys := ImplicitSystem block: [ :x :t | x * t ].
	stepper := ImplicitStepper onSystem: sys.
	dt := 0.1.
	stepper stepSize: dt.
	self assert: stepper stepSize equals: dt.
	self assert: (stepper doStep: 0 time: 10) equals: 0.101.
	self assert: (stepper doStep: 10 time: 0 stepSize: 1) equals: 21.

	"stepSize parameter changes the stored stepSize"
	self assert: stepper stepSize equals: 1.
	self assert: (stepper doStep: 1 time: 1) equals: 5.
	self
		assert: (stepper doStep: 10 time: 1 stepSize: 0.2)
		equals: 12.448