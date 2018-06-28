Class {
	#name : #PMODEAccuracy,
	#superclass : #Object,
	#instVars : [
		'dt',
		'function',
		'startState',
		'startTime',
		'endTime',
		'standard'
	],
	#category : 'Math-Accuracy-ODE'
}

{ #category : #'as yet unclassified' }
PMODEAccuracy class >> run [
	| instance checkSelectors |
	instance := self new.
	checkSelectors := self selectors select: [ :each | each beginsWith: 'check' ].
	^ (checkSelectors collect: [ :selector |
		(selector copyFrom: 6 to: selector size) ->
		((instance perform: selector) - instance standard) abs ]) asDictionary
]

{ #category : #'as yet unclassified' }
PMODEAccuracy class >> runToXML [
	| writer |
	writer := XMLWriter new.
	writer
		enablePrettyPrinting;
		xml.
	writer tag: 'accuracy' with: [ 
		self run keysAndValuesDo:  [ :key :value |
			writer tag: key with: value asString]].

	^ writer 
]

{ #category : #checks }
PMODEAccuracy >> checkAB2 [
	^ self checkSolverClass: AB2Solver systemClass: ExplicitSystem stepperClass: AB2Stepper

]

{ #category : #checks }
PMODEAccuracy >> checkAB3 [
	^ self checkSolverClass: AB3Solver systemClass: ExplicitSystem stepperClass: AB3Stepper
	
]

{ #category : #checks }
PMODEAccuracy >> checkAB4 [
	^ self checkSolverClass: AB4Solver systemClass: ExplicitSystem stepperClass: AB4Stepper
	
]

{ #category : #checks }
PMODEAccuracy >> checkAM3 [
	^ self
		checkSolverClass: AM3Solver
		systemClass: ImplicitSystem
		stepperClass: AM3Stepper
		
	
]

{ #category : #checks }
PMODEAccuracy >> checkAM4 [
	^ self
		checkSolverClass: AM4Solver
		systemClass: ImplicitSystem
		stepperClass: AM4Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBDF2 [
	^ self
		checkSolverClass: BDF2Solver
		systemClass: ImplicitSystem
		stepperClass: BDF2Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBDF3 [
	^ self
		checkSolverClass: BDF3Solver
		systemClass: ImplicitSystem
		stepperClass: BDF3Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBDF4 [
	^ self
		checkSolverClass: BDF4Solver
		systemClass: ImplicitSystem
		stepperClass: BDF4Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBeckwardEuler [
	^ self
		checkSolverClass: ImplicitSolver
		systemClass: ImplicitSystem
		stepperClass: ImplicitStepper
]

{ #category : #checks }
PMODEAccuracy >> checkEuler [
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: ExplicitStepper
]

{ #category : #checks }
PMODEAccuracy >> checkHeun [
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: HeunStepper
]

{ #category : #checks }
PMODEAccuracy >> checkImplicitMidpoint [
	^ self
		checkSolverClass: ImplicitMidpointSolver
		systemClass: ImplicitSystem
		stepperClass: ImplicitMidpointStepper
]

{ #category : #checks }
PMODEAccuracy >> checkMidpoint [
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: MidpointStepper
]

{ #category : #checks }
PMODEAccuracy >> checkRungeKutta [
	^ self
		checkSolverClass: ExplicitSolver
		systemClass: ExplicitSystem
		stepperClass: RungeKuttaStepper
]

{ #category : #utils }
PMODEAccuracy >> checkSolverClass: solverClass systemClass: systemClass stepperClass: stepperClass [
	| solver stepper system |
	system := systemClass block: function.
	stepper := stepperClass onSystem: system.
	solver := solverClass new stepper: stepper; system: system; dt: dt.
	^ solver solve: system startState: startState startTime:startTime endTime: endTime
]

{ #category : #checks }
PMODEAccuracy >> checkTrapezoidAM2 [
	^ self
		checkSolverClass: ImplicitSolver
		systemClass: ImplicitSystem
		stepperClass: TrapezoidStepper
]

{ #category : #initialization }
PMODEAccuracy >> initialize [
	dt :=0.09.
	function :=  [:x :t | (t ** 4) * (t sin ** (2 * t cos)) * ( (2 * t negated) * (2 * t sin) * (t sin log) + t * (2 * t cos) * (t tan reciprocal) + 5)].
	startState := 0.
	startTime := 0.3 .
	endTime := Float halfPi 
]

{ #category : #initialization }
PMODEAccuracy >> standard [
	standard
		ifNil: [ standard := [ :t | t ** 5 * (t sin ** (2 * t cos)) - 0.000888511 ] value: endTime ]. 
	^ standard
]
