Class {
	#name : #PMBDF4StepperTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-stepping' }
PMBDF4StepperTest >> testOrderIsFour [
	self assert: PMBDF4Stepper order equals: 4
]

{ #category : #'tests-stepping' }
PMBDF4StepperTest >> testSimpleSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t | t sin ].
	stepper := PMBDF4Stepper onSystem: system.
	solver := PMBDF4Solver new
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
PMBDF4StepperTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMBDF4Stepper onSystem: system.
	solver := (PMBDF4Solver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.5) closeTo:  4.03597).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 1.7) closeTo:  3.6812).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 2.0) closeTo: 3.5316).
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3.0) closeTo:  2.5637).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 4.0) closeTo:  0.35925)
]

{ #category : #'tests-stepping' }
PMBDF4StepperTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMBDF4Stepper onSystem: system.
	solver := PMBDF4Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.5)
		closeTo: 1.75.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.0)
		closeTo: 3.75.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.5)
		closeTo: 11.0227.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 2.0)
		closeTo: 43.2181.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 2.3)
		closeTo: 132.2771.
	self assert: ((solver
			  solve: system
			  startState: 1
			  startTime: 0
			  endTime: 2.5) closeTo: 224.881 precision: 0.001)
]
