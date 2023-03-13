Class {
	#name : #PMAM3SolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMAM3SolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMAM3Stepper onSystem: system.
	solver := (PMAM3Solver new) stepper: stepper; system: system; dt: dt.

	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  2.8978).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo: 0.8577)
]

{ #category : #'tests-solving' }
PMAM3SolverTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMAM3Stepper onSystem: system.
	solver := PMAM3Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.5)
		closeTo: 9.7551.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 1.5)
		closeTo: 9.7298.
	self
		assert: (solver
				 solve: system
				 startState: 0
				 startTime: 1
				 endTime: 2.5)
		closeTo: 0.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 2.5)
		closeTo: 415.6194
]

{ #category : #'tests-solving' }
PMAM3SolverTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMAM3Stepper onSystem: system.
	solver := PMAM3Solver new
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
