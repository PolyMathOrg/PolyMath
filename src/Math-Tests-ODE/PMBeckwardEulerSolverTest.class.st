Class {
	#name : #PMBeckwardEulerSolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMBeckwardEulerSolverTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem block: [ :x :t | t sin ].
	stepper := PMImplicitStepper onSystem: system.
	solver := PMImplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: -1
				startTime: 0
				endTime: Float pi) closeTo: 1)
]

{ #category : #'tests-solving' }
PMBeckwardEulerSolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMImplicitStepper onSystem: system.
	solver := (PMImplicitSolver new) stepper: stepper; system: system; dt: dt.
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  0.16567).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo: -0.5306)
]

{ #category : #'tests-solving' }
PMBeckwardEulerSolverTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem
		block: [ :x :t |
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := PMImplicitStepper onSystem: system.
	solver := PMImplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			(((solver
				solve: system
				startState: #(-1 0)
				startTime: 0
				endTime: Float pi) at: 1) closeTo: 1).
	self
		assert:
			(((solver
				solve: system
				startState: #(-1 0)
				startTime: 0
				endTime: Float pi / 2) at: 2) closeTo: 0.995)
]
