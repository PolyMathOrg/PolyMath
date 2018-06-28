Class {
	#name : #PMImplicitBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : 'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMImplicitBenchmark >> benchBeckwardEuler [
	| solver stepper |
	stepper := ImplicitStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitBenchmark >> benchImplicitMidpoint [
	| solver stepper |
	stepper := ImplicitMidpointStepper onSystem: system.
	solver := (ImplicitMidpointSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #'as yet unclassified' }
PMImplicitBenchmark >> setUp [
	super setUp.
	system := ImplicitSystem block: function.
]
