Class {
	#name : #PMAB2SolverTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-ODE'
}

{ #category : #'tests-solving' }
PMAB2SolverTest >> testSimpleSystem2 [
	| solver stepper system dt |
	dt := 1.5.
	system := PMExplicitSystem block: [:x :t | 3 * (t negated exp) - (0.4 * x)].
	stepper := PMAB2Stepper onSystem: system.
	solver := PMAB2Solver new stepper: stepper; system: system; dt: dt.
	self assert: ((solver solve: system startState: 5 startTime: 0 endTime: 3) closeTo: 1.1237).
	self assert: ((solver solve: system startState: 0 startTime: 1 endTime: 4) closeTo:  -0.2451).

]

{ #category : #'tests-solving' }
PMAB2SolverTest >> testSimpleSystem3 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [:x :t | 2 * t * x].
	stepper := PMAB2Stepper onSystem: system.
	solver := PMAB2Solver new stepper: stepper; system: system; dt: dt.
	self assert: ((solver solve: system startState: 1 startTime: 0 endTime: 1  ) closeTo: 2.1875).
	self assert: ((solver solve: system startState: 1.25 startTime: 0.5 endTime: 2  ) closeTo: 17.4512).

]

{ #category : #'tests-solving' }
PMAB2SolverTest >> testSimpleSystem4 [
	| solver stepper system dt |
	dt := 0.5.
	system := PMExplicitSystem block: [:x :t |  2 * (36 * (( t ln ) ** 2) + (6 * (t ln)) +7 )  /
		 ((t ** 3) * (1- (6 * (t ln))) ** 2)].
	stepper := PMAB2Stepper onSystem: system.
	solver := PMAB2Solver new stepper: stepper; system: system; dt: dt.
	self assert: ((solver solve: system startState: 2 startTime: 1 endTime: 4.5  ) closeTo: 22.3431).
	

]

{ #category : #'tests-solving' }
PMAB2SolverTest >> testVectorSystem [
	| solver stepper system dt |
	dt := 0.01.
	system := PMExplicitSystem block: [:x :t | 
												| v |
												v := PMVector new: 2. 
												v at: 1 put: t sin. 
												v at: 2 put: t cos.
												v].
	stepper := PMAB2Stepper onSystem: system.
	solver := PMAB2Solver new stepper: stepper; system: system; dt: dt.
	self assert: (((solver solve: system startState: #(-1 0) startTime: 0 endTime: Float pi ) at: 1) closeTo: 1).
	self assert: (((solver solve: system startState: #(-1 0) startTime: 0 endTime: Float pi / 2 ) at: 2 ) closeTo: 1).
]
