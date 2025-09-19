Class {
	#name : 'PMImplicitMidpointSolverTest',
	#superclass : 'PMAbstractTest',
	#category : 'Math-Tests-ODE',
	#package : 'Math-Tests-ODE'
}

{ #category : 'tests-solving' }
PMImplicitMidpointSolverTest >> testSimpleSystem2 [

    | solver stepper system dt |
    dt := 1.5.
    system := PMImplicitSystem block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
    stepper := PMImplicitMidpointStepper onSystem: system.
    solver := PMImplicitMidpointSolver new
                  stepper: stepper;
                  system: system;
                  dt: dt.
    self should: ((solver solve: system
              startState: 5
              startTime: 0
              endTime: 3) closeTo: 4.9733 precision: 0.0001).
    self should: ((solver solve: system
              startState: 0
              startTime: 1
              endTime: 2.5) closeTo: 0.8242 precision: 0.0001)
]
