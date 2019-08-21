"
An ExplicitStepperTest is a test class for testing the behavior of ExplicitStepper
"
Class {
	#name : #PMEulerStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMEulerStepperTest >> testDoStepTime [
	"this is identical to testDoStepTimeStepSize except dt is stored."

	| stepper sys dt |
	sys := PMExplicitSystem block: [ :x :t | x * t ].
	stepper := PMExplicitStepper onSystem: sys.
	dt := 0.1.
	stepper stepSize: dt.
	self assert: stepper stepSize equals: dt.
	self assert: (stepper doStep: 0 time: 10) equals: 0.
	self assert: (stepper doStep: 10 time: 0 stepSize: 1) equals: 10.

	"stepSize parameter changes the stored stepSize"
	self assert: stepper stepSize equals: 1.
	self assert: (stepper doStep: 1 time: 1) equals: 2.
	self assert: (stepper doStep: 10 time: 1 stepSize: 0.2) equals: 12.0
]

{ #category : #'tests-stepping' }
PMEulerStepperTest >> testDoStepTimeStepSize [
	| stepper sys dt |
	sys := PMExplicitSystem block: [ :x :t | x * t ].
	stepper := PMExplicitStepper onSystem: sys.
	dt := 0.1.
	self assert: (stepper doStep: 0 time: 10 stepSize: dt) equals: 0.
	self assert: (stepper doStep: 10 time: 0 stepSize: dt) equals: 10.
	self assert: (stepper doStep: 1 time: 1 stepSize: dt) equals: 1.1.
	self assert: (stepper doStep: 10 time: 1 stepSize: dt) equals: 11.0
]

{ #category : #'tests-stepping' }
PMEulerStepperTest >> testOrderOfBaseExplicitStepperIsOne [
	| order |
	order := PMExplicitStepper new order.
	self assert: order notNil.
	self assert: order equals: 1
]

{ #category : #'tests-stepping' }
PMEulerStepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.001.
	system := PMExplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := PMExplicitStepper onSystem: system.
	solver := PMExplicitSolver new
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
				endTime: Float pi / 2) at: 2) closeTo: 1.0004)
]
