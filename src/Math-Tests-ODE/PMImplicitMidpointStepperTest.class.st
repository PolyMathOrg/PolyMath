Class {
	#name : #PMImplicitMidpointStepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMImplicitMidpointStepperTest >> testOrderIsTwo [
	self assert: PMImplicitMidpointStepper order equals: 2
]

{ #category : #'tests-stepping' }
PMImplicitMidpointStepperTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t | t sin ].
	stepper := PMImplicitMidpointStepper onSystem: system.
	solver := PMImplicitMidpointSolver new
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
PMImplicitMidpointStepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMImplicitMidpointStepper onSystem: system.
	solver := (PMImplicitMidpointSolver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  5.9805).
      self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  0.8242).
]

{ #category : #'tests-stepping' }
PMImplicitMidpointStepperTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMImplicitMidpointStepper onSystem: system.
	solver := PMImplicitMidpointSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1) closeTo: 2.6348)
]

{ #category : #'tests-stepping' }
PMImplicitMidpointStepperTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := PMImplicitMidpointStepper onSystem: system.
	solver := PMImplicitMidpointSolver new
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
