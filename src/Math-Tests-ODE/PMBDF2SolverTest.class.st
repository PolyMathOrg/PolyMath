Class {
	#name : 'PMBDF2SolverTest',
	#superclass : 'PMAbstractTest',
	#category : 'Math-Tests-ODE',
	#package : 'Math-Tests-ODE'
}

{ #category : 'tests-solving' }
PMBDF2SolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMBDF2Stepper onSystem: system.
	solver := (PMBDF2Solver new) stepper: stepper; system: system; dt: dt.

	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  0.54985 precision: 0.00001).
   self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  -0.5306 precision: 0.0001)
]

{ #category : 'tests-solving' }
PMBDF2SolverTest >> testSimpleSystem3 [

	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMBDF2Stepper onSystem: system.
	solver := PMBDF2Solver new
		          stepper: stepper;
		          system: system;
		          dt: dt.
	self
		assert: (solver
				 solve: system
				 startState: 1
				 startTime: 0
				 endTime: 1.5)
		closeTo: 11.9167.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 1.5)
		closeTo: 9.5833.
	self
		assert: (solver
				 solve: system
				 startState: 0
				 startTime: 1
				 endTime: 2.5)
		closeTo: 21.9166.
	self
		assert: (solver
				 solve: system
				 startState: 1.25
				 startTime: 0.5
				 endTime: 2.5)
		closeTo: 273.7129
]

{ #category : 'tests-solving' }
PMBDF2SolverTest >> testSolveStartStateStartTimeEndTimeStepSize [
	| solver stepper system dt finalState |
	dt := 0.2.
	system := PMImplicitSystem block: [ :x :t | (t * x) exp ].
	stepper := PMImplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := PMBDF2Solver new
		system: system;
		stepper: stepper.
	finalState := solver
		solve: solver system
		startState: 0
		startTime: 0
		endTime: 1
		stepSize: dt.
	self assert: finalState isFloat
]

{ #category : 'tests-solving' }
PMBDF2SolverTest >> testSolveX0T0T1 [
	| solver stepper system dt finalState |
	dt := 0.1.
	system := PMImplicitSystem block: [ :x :t | (t * x) exp ].
	stepper := PMImplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := PMBDF2Solver new
		system: system;
		stepper: stepper;
		dt: dt.
	finalState := solver
		solve: solver system
		startState: 0
		startTime: 0
		endTime: 1.
	self assert: finalState isFloat
]
