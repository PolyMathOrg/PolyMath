Class {
	#name : #PMBDF4SolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMBDF4SolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMBDF4Stepper onSystem: system.
	solver := (PMBDF4Solver new) stepper: stepper; system: system; dt: dt.

	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  2.5637).
      self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  0.4395).
	self should: ((solver solve: system startState: 0 startTime: 0 endTime: 3) closeTo:  1.0793)
]

{ #category : #'tests-solving' }
PMBDF4SolverTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMBDF4Stepper onSystem: system.
	solver := PMBDF4Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 0.25
				startTime: 0.5
				endTime: 2.0) closeTo: 13.4091).
	self
		assert:
			((solver
				solve: system
				startState: 0.25
				startTime: 0.5
				endTime: 2.3) closeTo: 41.21625).
	self
		assert:
			((solver
				solve: system
				startState: 0.25
				startTime: 0.5
				endTime: 2.5) closeTo: 69.9482).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 2.8) closeTo: 71.9236).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 11.0227)
]

{ #category : #'tests-solving' }
PMBDF4SolverTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMImplicitSystem
		block: [ :x :t |
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := PMBDF4Stepper onSystem: system.
	solver := PMBDF4Solver new
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
				endTime: Float pi / 2) at: 2) closeTo: 1)
]
