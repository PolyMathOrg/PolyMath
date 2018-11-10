"
An ODESolverTest is a test class for testing the behavior of ODESolver
"
Class {
	#name : #PMEulerSolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMEulerSolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := HeunStepper onSystem: system.
	solver := ExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 5
				startTime: 0
				endTime: 1.5) closeTo: 4.30204).
	self
		should:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.5) closeTo: 0.5158)
]

{ #category : #'tests-solving' }
PMEulerSolverTest >> testSolveStartStateStartTimeEndTimeStepSize [
	| solver stepper system dt finalState |
	dt := 0.2.
	system := ExplicitSystem block: [ :x :t | (t * x) exp ].
	stepper := ExplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := ExplicitSolver new
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
PMEulerSolverTest >> testSolveX0T0T1 [
	| solver stepper system dt finalState |
	dt := 0.1.
	system := ExplicitSystem block: [ :x :t | (t * x) exp ].
	stepper := ExplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := ExplicitSolver new
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
