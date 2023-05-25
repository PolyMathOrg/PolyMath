Class {
	#name : #PMRungeKuttaSolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMRungeKuttaSolverTest >> testSimpleSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t | t sin ].
	stepper := PMRungeKuttaStepper onSystem: system.
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

{ #category : #'tests-solving' }
PMRungeKuttaSolverTest >> testSimpleSystem1 [

	| solver stepper system dt |
	dt := 0.025.
	system := PMExplicitSystem block: [ :x :t | t tan + 1 ].
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := PMExplicitSolver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 0
				 startTime: 1
				 endTime: 1.05)
		closeTo: 0.1324.
	self
		assert: (solver
				 solve: system
				 startState: 0
				 startTime: 1
				 endTime: 1.09)
		closeTo: 0.2455.
	self
		assert: (solver
				 solve: system
				 startState: 0
				 startTime: 1
				 endTime: 1.11)
		closeTo: 0.3048
]

{ #category : #'tests-solving' }
PMRungeKuttaSolverTest >> testSimpleSystem2 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMRungeKuttaStepper onSystem: system.
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
		closeTo: 4.3724.
	self
		assert: (solver
				 solve: system
				 startState: 5
				 startTime: 0
				 endTime: 3)
		closeTo: 2.7629.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.1)
		closeTo: 2.1997
]

{ #category : #'tests-solving' }
PMRungeKuttaSolverTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMRungeKuttaStepper onSystem: system.
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
		closeTo: 1.0408.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 0.5)
		closeTo: 1.2838.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.1)
		closeTo: 3.3471.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.5)
		closeTo: 9.3723
]

{ #category : #'tests-solving' }
PMRungeKuttaSolverTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMRungeKuttaStepper onSystem: system.
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
