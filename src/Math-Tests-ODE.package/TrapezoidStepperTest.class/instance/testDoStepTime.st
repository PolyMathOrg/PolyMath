tests-stepping
testDoStepTime
	"this is identical to testDoStepTimeStepSize except dt is stored."

	| stepper sys dt |
	sys := ImplicitSystem block: [ :x :t | x * t ].
	stepper := TrapezoidStepper onSystem: sys.
	dt := 0.1.
	stepper stepSize: dt.
	self assert: stepper stepSize equals: dt.
	self assert: ((stepper doStep: 0 time: 10) closeTo: 0).
	self assert: ((stepper doStep: 10 time: 0 stepSize: 1) closeTo: 17.5).

	"stepSize parameter changes the stored stepSize"
	self assert: stepper stepSize equals: 1.
	self assert: ((stepper doStep: 1 time: 1) closeTo: 5).
	self
		assert: ((stepper doStep: 10 time: 1 stepSize: 0.2) closeTo: 12.4928)