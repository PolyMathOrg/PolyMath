Class {
	#name : #PMAB3SolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMAB3SolverTest >> testSimpleSystem2 [

	| solver stepper system dt |
	dt := 1.5.
	system := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMAB3Stepper onSystem: system.
	solver := PMAB3Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 5
				 startTime: 0
				 endTime: 3)
		closeTo: 1.1237.
	self should: ((solver
			  solve: system
			  startState: 0
			  startTime: 1
			  endTime: 4) closeTo: -0.2451)
]

{ #category : #'tests-solving' }
PMAB3SolverTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMAB3Stepper onSystem: system.
	solver := PMAB3Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1)
		closeTo: 2.1875.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 2)
		closeTo: 19.2822
]

{ #category : #'tests-solving' }
PMAB3SolverTest >> testSimpleSystem4 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 negated * (t ** 4) * (x ** 2) + 1 - (x * (t ** 2)) / (t ** 3) ].
	stepper := PMAB3Stepper onSystem: system.
	solver := PMAB3Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 2
				 startTime: 1
				 endTime: 4.5)
		closeTo: -1.6539239077654698e49
]

{ #category : #'tests-solving' }
PMAB3SolverTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.001.
	system := PMExplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMAB3Stepper onSystem: system.
	solver := PMAB3Solver new
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
