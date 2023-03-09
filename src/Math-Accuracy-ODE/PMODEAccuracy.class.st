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
	#category : #'Math-Accuracy-ODE'
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
	^ self checkSolverClass: PMAB2Solver systemClass: PMExplicitSystem stepperClass: PMAB2Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkAB3 [
	^ self checkSolverClass: PMAB3Solver systemClass: PMExplicitSystem stepperClass: PMAB3Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkAB4 [
	^ self checkSolverClass: PMAB4Solver systemClass: PMExplicitSystem stepperClass: PMAB4Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkAM3 [
	^ self
		checkSolverClass: PMAM3Solver
		systemClass: PMImplicitSystem
		stepperClass: PMAM3Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkAM4 [
	^ self
		checkSolverClass: PMAM4Solver
		systemClass: PMImplicitSystem
		stepperClass: PMAM4Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBDF2 [
	^ self
		checkSolverClass: PMBDF2Solver
		systemClass: PMImplicitSystem
		stepperClass: PMBDF2Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBDF3 [
	^ self
		checkSolverClass: PMBDF3Solver
		systemClass: PMImplicitSystem
		stepperClass: PMBDF3Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBDF4 [
	^ self
		checkSolverClass: PMBDF4Solver
		systemClass: PMImplicitSystem
		stepperClass: PMBDF4Stepper
]

{ #category : #checks }
PMODEAccuracy >> checkBeckwardEuler [
	^ self
		checkSolverClass: PMImplicitSolver
		systemClass: PMImplicitSystem
		stepperClass: PMImplicitStepper
]

{ #category : #checks }
PMODEAccuracy >> checkEuler [
	^ self
		checkSolverClass: PMExplicitSolver
		systemClass: PMExplicitSystem
		stepperClass: PMExplicitStepper
]

{ #category : #checks }
PMODEAccuracy >> checkHeun [
	^ self
		checkSolverClass: PMExplicitSolver
		systemClass: PMExplicitSystem
		stepperClass: PMHeunStepper
]

{ #category : #checks }
PMODEAccuracy >> checkImplicitMidpoint [
	^ self
		checkSolverClass: PMImplicitMidpointSolver
		systemClass: PMImplicitSystem
		stepperClass: PMImplicitMidpointStepper
]

{ #category : #checks }
PMODEAccuracy >> checkMidpoint [
	^ self
		checkSolverClass: PMExplicitSolver
		systemClass: PMExplicitSystem
		stepperClass: PMMidpointStepper
]

{ #category : #checks }
PMODEAccuracy >> checkRungeKutta [
	^ self
		checkSolverClass: PMExplicitSolver
		systemClass: PMExplicitSystem
		stepperClass: PMRungeKuttaStepper
]

{ #category : #utilities }
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
		checkSolverClass: PMImplicitSolver
		systemClass: PMImplicitSystem
		stepperClass: PMTrapezoidStepper
]

{ #category : #initialization }
PMODEAccuracy >> initialize [

	super initialize.
	dt := 0.09.
	function := [ :x :t | t ** 4 * (t sin ** (2 * t cos)) * (2 * t negated * (2 * t sin) * t sin log + t * (2 * t cos) * t tan reciprocal + 5) ].
	startState := 0.
	startTime := 0.3.
	endTime := Float halfPi
]

{ #category : #initialization }
PMODEAccuracy >> standard [
	standard
		ifNil: [ standard := [ :t | t ** 5 * (t sin ** (2 * t cos)) - 0.000888511 ] value: endTime ].
	^ standard
]
