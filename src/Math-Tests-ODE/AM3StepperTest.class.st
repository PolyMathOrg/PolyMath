Class {
	#name : #AM3StepperTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
AM3StepperTest >> testOrderIsThree [
	self assert: AM3Stepper order equals: 3
]

{ #category : #'tests-stepping' }
AM3StepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem block: [ :x :t | t sin ].
	stepper := AM3Stepper onSystem: system.
	solver := AM3Solver new
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
AM3StepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := AM3Stepper onSystem: system.
	solver := (AM3Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo: 4.5912).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo: 4.9614).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  2.8977).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 4.0) closeTo:  0.5375).
]

{ #category : #'tests-stepping' }
AM3StepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := AM3Stepper onSystem: system.
	solver := AM3Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.2) closeTo: 1.11).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.5) closeTo: 1.3125).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1.3) closeTo: 6.7429).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.3) closeTo: 6.76035)
]

{ #category : #'tests-stepping' }
AM3StepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := AM3Stepper onSystem: system.
	solver := AM3Solver new
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
