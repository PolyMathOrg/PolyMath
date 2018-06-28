Class {
	#name : #PMExplicitBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : 'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMExplicitBenchmark >> benchEuler [
	|  solver stepper |
	stepper := ExplicitStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitBenchmark >> benchHeun [
	| solver stepper |
	stepper := HeunStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitBenchmark >> benchMidpoint [
	| solver stepper |
	stepper := MidpointStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitBenchmark >> benchRungeKutta [
	| solver stepper |
	stepper := RungeKuttaStepper onSystem: system.
	solver := (ExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #running }
PMExplicitBenchmark >> setUp [
	super setUp.
	system := ExplicitSystem block: function.

]
