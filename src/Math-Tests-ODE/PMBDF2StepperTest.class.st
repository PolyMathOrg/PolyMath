Class {
	#name : #PMBDF2StepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMBDF2StepperTest >> testOrderIsTwo [
	self assert: BDF2Stepper order equals: 2
]

{ #category : #'tests-stepping' }
PMBDF2StepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem block: [ :x :t | t sin ].
	stepper := BDF2Stepper onSystem: system.
	solver := BDF2Solver new
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
PMBDF2StepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo:  1.10147).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  2.10409).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  0.54985).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 4.0) closeTo:  -0.71539).
	
]

{ #category : #'tests-stepping' }
PMBDF2StepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := BDF2Stepper onSystem: system.
	solver := BDF2Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.2) closeTo: 1.3).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.5) closeTo: 1.75).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1.3) closeTo: 6.0793).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.3) closeTo: 7.5367)
]

{ #category : #'tests-stepping' }
PMBDF2StepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.0001.
	system := ImplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := BDF2Stepper onSystem: system.
	solver := BDF2Solver new
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
