Class {
	#name : #PMTrapezoidStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMTrapezoidStepperTest >> testDoStepTime [
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
]

{ #category : #'tests-stepping' }
PMTrapezoidStepperTest >> testDoStepTimeStepSize1 [
	| stepper sys dt |
	sys := ImplicitSystem block: [ :x :t | x * t ].
	stepper := TrapezoidStepper onSystem: sys.
	dt := 0.1.
	self assert: ((stepper doStep: 0 time: 10 stepSize: dt) closeTo: 0.0).
	self
		assert: ((stepper doStep: 10 time: 0 stepSize: dt) closeTo: 10.05).
	self
		assert: ((stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.1111).
	self
		assert: ((stepper doStep: 10 time: 1 stepSize: dt) closeTo: 11.11)
]

{ #category : #'tests-stepping' }
PMTrapezoidStepperTest >> testDoStepTimeStepSize2 [
	| stepper sys dt |
	sys := ImplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := TrapezoidStepper onSystem: sys.
	dt := 0.1.
	self
		assert: ((stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.0638).
	self
		assert: ((stepper doStep: 10 time: 1 stepSize: dt) closeTo: 9.7109)
]

{ #category : #'tests-stepping' }
PMTrapezoidStepperTest >> testOrderIsTwo [
	self assert: TrapezoidStepper order equals: 2
]

{ #category : #'tests-stepping' }
PMTrapezoidStepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := TrapezoidStepper onSystem: system.
	solver := ImplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			(((solver
				solve: system
				startState: #(-1 0)
				startTime: 0
				endTime: Float pi) at: 1) closeTo: 1).
	self
		assert:
			(((solver
				solve: system
				startState: #(-1 0)
				startTime: 0
				endTime: Float pi / 2) at: 2) closeTo: 1)
]
