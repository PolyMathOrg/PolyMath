Class {
	#name : #PMAM4SolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMAM4SolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := ImplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := AM4Stepper onSystem: system.
	solver := (AM4Solver new) stepper: stepper; system: system; dt: dt.
	
	self should: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo:  2.6231).
       self should: ((solver solve: system startState: 0 startTime: 1 endTime: 2.5) closeTo:  0.8577).
]

{ #category : #'tests-solving' }
PMAM4SolverTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := ImplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := AM4Stepper onSystem: system.
	solver := AM4Solver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 15.2741).
	self
		assert:
			((solver
				solve: system
				startState: 1.25
				startTime: 0.5
				endTime: 2.2) closeTo: 191.3011).
	self
		assert:
			((solver
				solve: system
				startState: 0.5
				startTime: 1
				endTime: 2.5) closeTo: 112.8325).
	self
		assert:
			((solver
				solve: system
				startState: 0.5
				startTime: 1
				endTime: 2.8) closeTo: 535.8236)
]

{ #category : #'tests-solving' }
PMAM4SolverTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := ImplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := AM4Stepper onSystem: system.
	solver := AM4Solver new
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
