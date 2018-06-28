Class {
	#name : #BDF2SolverTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
BDF2SolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  0.54985).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  -0.5306).
]

{ #category : #'tests-solving' }
BDF2SolverTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := BDF2Stepper onSystem: system.
	solver := BDF2Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 11.9167).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 1.5) closeTo: 9.5833).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 21.9166).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 2.5) closeTo: 273.7129)
]

{ #category : #'tests-solving' }
BDF2SolverTest >> testSolveStartStateStartTimeEndTimeStepSize [
	| solver stepper system dt finalState |
	dt := 0.2.
	system := ImplicitSystem block: [ :x :t | (t * x) exp ].
	stepper := ImplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := BDF2Solver new
		system: system;
		stepper: stepper.
	finalState := solver
		solve: solver system
		startState: 0
		startTime: 0
		endTime: 1
		stepSize: dt.
	self assert: finalState isFloat.

	"Debgging information"
	Transcript
		show: self class name;
		cr;
		show: system block printString;
		cr;
		show: 'from x(0) = 0 to x(1) = ';
		show: finalState;
		cr;
		show: 'with stepSize = ' , solver dt printString;
		cr
]

{ #category : #'tests-solving' }
BDF2SolverTest >> testSolveX0T0T1 [
	| solver stepper system dt finalState |
	dt := 0.1.
	system := ImplicitSystem block: [ :x :t | (t * x) exp ].
	stepper := ImplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := BDF2Solver new
		system: system;
		stepper: stepper;
		dt: dt.
	finalState := solver
		solve: solver system
		startState: 0
		startTime: 0
		endTime: 1.
	self assert: finalState isFloat.

	"Debgging information"
	Transcript
		show: self class name;
		cr;
		show: system block printString;
		cr;
		show: 'from x(0) = 0 to x(1) = ';
		show: finalState;
		cr;
		show: 'with stepSize = ' , solver dt printString;
		cr
]
