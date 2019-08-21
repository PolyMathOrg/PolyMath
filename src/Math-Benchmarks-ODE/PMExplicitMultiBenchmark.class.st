Class {
	#name : #PMExplicitMultiBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : 'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMExplicitMultiBenchmark >> benchAB2 [
	| solver stepper |
	stepper := PMAB2Stepper onSystem: system.
	solver := (PMAB2Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitMultiBenchmark >> benchAB3 [
	| solver stepper |
	stepper := PMAB3Stepper onSystem: system.
	solver := (PMAB3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitMultiBenchmark >> benchAB4 [
	| solver stepper |
	stepper := PMAB4Stepper onSystem: system.
	solver := (PMAB4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #'as yet unclassified' }
PMExplicitMultiBenchmark >> setUp [
	super setUp.
	system := PMExplicitSystem block: function
]
