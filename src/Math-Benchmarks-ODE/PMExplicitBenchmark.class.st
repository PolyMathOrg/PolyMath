Class {
	#name : #PMExplicitBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : #'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMExplicitBenchmark >> benchEuler [
	|  solver stepper |
	stepper := PMExplicitStepper onSystem: system.
	solver := (PMExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitBenchmark >> benchHeun [
	| solver stepper |
	stepper := PMHeunStepper onSystem: system.
	solver := (PMExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitBenchmark >> benchMidpoint [
	| solver stepper |
	stepper := PMMidpointStepper onSystem: system.
	solver := (PMExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMExplicitBenchmark >> benchRungeKutta [
	| solver stepper |
	stepper := PMRungeKuttaStepper onSystem: system.
	solver := (PMExplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #running }
PMExplicitBenchmark >> setUp [
	super setUp.
	system := PMExplicitSystem block: function
]
