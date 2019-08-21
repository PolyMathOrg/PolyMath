Class {
	#name : #PMHeunStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #tests }
PMHeunStepperTest >> testOrderIsTwo [
	self assert: PMHeunStepper order equals: 2
]

{ #category : #tests }
PMHeunStepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t | t sin ].
	stepper := PMHeunStepper onSystem: system.
	solver := PMExplicitSolver new
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
PMHeunStepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMHeunStepper onSystem: system.
	solver := PMExplicitSolver new
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
PMHeunStepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMHeunStepper onSystem: system.
	solver := PMExplicitSolver new
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
PMHeunStepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := PMHeunStepper onSystem: system.
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
				endTime: Float pi / 2) at: 2) closeTo: 1)
]
