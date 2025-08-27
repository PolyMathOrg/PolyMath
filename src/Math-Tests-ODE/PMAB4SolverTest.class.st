Class {
	#name : 'PMAB4SolverTest',
	#superclass : 'PMAbstractTest',
	#category : 'Math-Tests-ODE',
	#package : 'Math-Tests-ODE'
}

{ #category : 'tests-solving' }
PMAB4SolverTest >> testSimpleSystem2 [

    | solver stepper system dt |
    dt := 1.5.
    system := PMExplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
    stepper := PMAB4Stepper onSystem: system.
    solver := PMAB4Solver new
                  stepper: stepper;
                  system: system;
                  dt: dt.
    self
        assert: (solver solve: system
                 startState: 5
                 startTime: 0
                 endTime: 3)
        closeTo: 1.1237
        precision: 0.0001.
    self should: ((solver solve: system
              startState: 0
              startTime: 1
              endTime: 4) closeTo: -0.2451 precision: 0.0001)
]

{ #category : 'tests-solving' }
PMAB4SolverTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMAB4Stepper onSystem: system.
	solver := PMAB4Solver new
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
				 startState: 1
				 startTime: 0
				 endTime: 1.5)
		closeTo: 5.546875.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.7)
		closeTo: 11.4082.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 2.0)
		closeTo: 20.2002.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 2.5)
		closeTo: 95.5152
]

{ #category : 'tests-solving' }
PMAB4SolverTest >> testVectorSystem [

	| solver stepper system dt |
	dt := 0.001.
	system := PMExplicitSystem block: [ :x :t |
		          | c |
		          c := PMVector new: 2.
		          c at: 1 put: t sin.
		          c at: 2 put: t cos.
		          c ].
	stepper := PMAB4Stepper onSystem: system.
	solver := PMAB4Solver new
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
