Class {
	#name : #PMTrapezoidSolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMTrapezoidSolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMTrapezoidStepper onSystem: system.
	solver := (PMImplicitSolver new) stepper: stepper; system: system; dt: dt.

	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  3.1299).
   self should: ((solver solve: system startState: 0.1 startTime: 1 endTime: 2.5) closeTo:  0.9103)
]

{ #category : #'tests-solving' }
PMTrapezoidSolverTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMTrapezoidStepper onSystem: system.
	solver := PMImplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.2)
		closeTo: 1.11.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.5)
		closeTo: 11.0742.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 1.5)
		closeTo: 10.5468.
	self
		assert: (solver
				 solve: system
				 startState: 0.1
				 startTime: 1
				 endTime: 2.5)
		closeTo: 20.6718
]

{ #category : #'tests-solving' }
PMTrapezoidSolverTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMTrapezoidStepper onSystem: system.
	solver := PMImplicitSolver new
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
