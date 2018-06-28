Class {
	#name : #HeunStepperTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-ODE'
}

{ #category : #tests }
HeunStepperTest >> testOrderIsTwo [
	self assert: HeunStepper order equals: 2
]

{ #category : #tests }
HeunStepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem block: [ :x :t | t sin ].
	stepper := HeunStepper onSystem: system.
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

{ #category : #tests }
HeunStepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := HeunStepper onSystem: system.
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
				endTime: 0.5) closeTo: 5.15489).
	self
		should:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.5) closeTo: 0.3881)
]

{ #category : #tests }
HeunStepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := ExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := HeunStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.5) closeTo: 1.25).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1) closeTo: 2.5)
]

{ #category : #tests }
HeunStepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ExplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := HeunStepper onSystem: system.
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
