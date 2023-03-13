Class {
	#name : #PMAM4StepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMAM4StepperTest >> testOrderIsFour [
	self assert: PMAM4Stepper order equals: 4
]

{ #category : #'tests-stepping' }
PMAM4StepperTest >> testSimpleSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t | t sin ].
	stepper := PMAM4Stepper onSystem: system.
	solver := PMAM4Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: -1
				 startTime: 0
				 endTime: Float pi)
		closeTo: 1
]

{ #category : #'tests-stepping' }
PMAM4StepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMAM4Stepper onSystem: system.
	solver := (PMAM4Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo:  4.5912).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  4.9614).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  2.6231).
       self should: ((solver solve: system startState: 0.1 startTime: 2 endTime: 4.1) closeTo:  0.2908)
]

{ #category : #'tests-stepping' }
PMAM4StepperTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMAM4Stepper onSystem: system.
	solver := PMAM4Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.5)
		closeTo: 1.3125.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 1.3)
		closeTo: 6.7429.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.3)
		closeTo: 9.6147
]
