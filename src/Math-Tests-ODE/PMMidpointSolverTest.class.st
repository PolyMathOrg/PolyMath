Class {
	#name : #PMMidpointSolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMMidpointSolverTest >> testSimpleSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [ :x :t | t sin ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
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
PMMidpointSolverTest >> testSimpleSystem1 [
	| solver stepper system dt |
	dt := 0.025.
	system := PMExplicitSystem block: [ :x :t | t tan + 1 ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.05) closeTo: 0.13237).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.09) closeTo: 0.2455).
	self
		assert:
			((solver
				solve: system
				startState: 0
				startTime: 1
				endTime: 1.11) closeTo: 0.3048)
]

{ #category : #'tests-solving' }
PMMidpointSolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem
		block: [ :x :t | 3 * t negated exp - (0.4 * x) ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 5
				startTime: 0
				endTime: 1.5) closeTo: 4.32246).
	self
		assert:
			((solver
				solve: system
				startState: 5
				startTime: 0
				endTime: 3) closeTo: 2.7326).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.1) closeTo: 2.14437)
]

{ #category : #'tests-solving' }
PMMidpointSolverTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [ :x :t | 2 * t * x ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
		stepper: stepper;
		system: system;
		dt: dt.
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.2) closeTo: 1.04).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 0.5) closeTo: 1.25).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.1) closeTo: 2.9813).
	self
		assert:
			((solver
				solve: system
				startState: 1
				startTime: 0
				endTime: 1.5) closeTo: 6.9629)
]

{ #category : #'tests-solving' }
PMMidpointSolverTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem
		block: [ :x :t | 
			| c |
			c := PMVector new: 2.
			c at: 1 put: t sin.
			c at: 2 put: t cos.
			c ].
	stepper := PMMidpointStepper onSystem: system.
	solver := PMExplicitSolver new
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
