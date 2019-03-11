Class {
	#name : #PMRungeKuttaStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMRungeKuttaStepperTest >> testDoStepTimeStepSize1 [
	| stepper sys dt |
	sys := ExplicitSystem block: [ :x :t | x * t ].
	stepper := RungeKuttaStepper onSystem: sys.
	dt := 0.1.
	self assert: ((stepper doStep: 0 time: 10 stepSize: dt) closeTo: 0.0).
	self
		assert: ((stepper doStep: 10 time: 0 stepSize: dt) closeTo: 10.05).
	self
		assert: ((stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.1107).
	self
		assert: ((stepper doStep: 10 time: 1 stepSize: dt) closeTo: 11.1071)
]

{ #category : #'tests-stepping' }
PMRungeKuttaStepperTest >> testDoStepTimeStepSize2 [
	| stepper sys dt |
	sys := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := RungeKuttaStepper onSystem: sys.
	dt := 0.1.
	self
		assert: ((stepper doStep: 1 time: 1 stepSize: dt) closeTo: 1.0638).
	self
		assert: ((stepper doStep: 10 time: 1 stepSize: dt) closeTo: 9.7109)
]

{ #category : #'tests-stepping' }
PMRungeKuttaStepperTest >> testOrderIsFour [
	self assert: RungeKuttaStepper order equals: 4
]

{ #category : #'tests-stepping' }
PMRungeKuttaStepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [ :x :t | t sin ].
	stepper := RungeKuttaStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: -1
				startTime: 0
				endTime: Float pi) closeTo: 1)
]

{ #category : #'tests-stepping' }
PMRungeKuttaStepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := RungeKuttaStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 5
				startTime: 0
				endTime: 1.5) closeTo: 4.3646).
	self
		should:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 0.5951)
]

{ #category : #'tests-stepping' }
PMRungeKuttaStepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := RungeKuttaStepper onSystem: system.
	solver := ExplicitSolver new
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
