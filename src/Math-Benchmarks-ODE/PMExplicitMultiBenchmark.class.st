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
	stepper := AB2Stepper onSystem: system.
	solver := (AB2Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitMultiBenchmark >> benchAB3 [
	| solver stepper |
	stepper := AB3Stepper onSystem: system.
	solver := (AB3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitMultiBenchmark >> benchAB4 [
	| solver stepper |
	stepper := AB4Stepper onSystem: system.
	solver := (AB4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #'as yet unclassified' }
PMExplicitMultiBenchmark >> setUp [
	super setUp.
	system := ExplicitSystem block: function
]
