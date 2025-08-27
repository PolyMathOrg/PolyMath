Class {
	#name : 'PMMidpointStepperTest',
	#superclass : 'PMAbstractTest',
	#category : 'Math-Tests-ODE',
	#package : 'Math-Tests-ODE'
}

{ #category : 'tests-stepping' }
PMMidpointStepperTest >> testOrderIsTwo [
	self assert: PMMidpointStepper order equals: 2
]

{ #category : 'tests-stepping' }
PMMidpointStepperTest >> testSimpleSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t | t sin ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
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

{ #category : 'tests-stepping' }
PMMidpointStepperTest >> testSimpleSystem2 [

	| solver stepper system dt |
	dt := 1.5.
	system := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 5
				 startTime: 0
				 endTime: 1.5)
		closeTo: 3.6756.
	self
		assert: (solver
				 solve: system
				 startState: 5
				 startTime: 0
				 endTime: 3)
		closeTo: 2.3049
]

{ #category : 'tests-stepping' }
PMMidpointStepperTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.2)
		closeTo: 1.04.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.5)
		closeTo: 1.25.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1)
		closeTo: 2.4219
]

{ #category : 'tests-stepping' }
PMMidpointStepperTest >> testSimpleSystem4 [

	| solver stepper system dt |
	dt := 0.0001.
	system := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 5
				 startTime: 0
				 endTime: 1.5)
		closeTo: 4.3724
]

{ #category : 'tests-stepping' }
PMMidpointStepperTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: ((solver
				  solve: system
				  startState: #( -1 0 )
				  startTime: 0
				  endTime: Float pi) at: 1)
		closeTo: 1.
	self
		assert: ((solver
				  solve: system
				  startState: #( -1 0 )
				  startTime: 0
				  endTime: Float pi / 2) at: 2)
		closeTo: 1
]
