Class {
	#name : #PMBDF3StepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMBDF3StepperTest >> testOrderIsThree [
	self assert: PMBDF3Stepper order equals: 3
]

{ #category : #'tests-stepping' }
PMBDF3StepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t | t sin ].
	stepper := PMBDF3Stepper onSystem: system.
	solver := PMBDF3Solver new
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
PMBDF3StepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMBDF3Stepper onSystem: system.
	solver := (PMBDF3Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo:  1.10147).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  2.10409).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  0.54985).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 4.0) closeTo:  -0.71539)
]

{ #category : #'tests-stepping' }
PMBDF3StepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMBDF3Stepper onSystem: system.
	solver := PMBDF3Solver new
		stepper: stepper;
		system: system;
		dt: dt.
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
				endTime: 1.3) closeTo: 7.4391)
]
