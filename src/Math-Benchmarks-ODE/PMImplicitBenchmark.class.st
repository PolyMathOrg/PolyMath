Class {
	#name : #PMImplicitBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : #'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMImplicitBenchmark >> benchBeckwardEuler [
	| solver stepper |
	stepper := PMImplicitStepper onSystem: system.
	solver := (PMImplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitBenchmark >> benchImplicitMidpoint [
	| solver stepper |
	stepper := PMImplicitMidpointStepper onSystem: system.
	solver := (PMImplicitMidpointSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #running }
PMImplicitBenchmark >> setUp [
	super setUp.
	system := PMImplicitSystem block: function
]
