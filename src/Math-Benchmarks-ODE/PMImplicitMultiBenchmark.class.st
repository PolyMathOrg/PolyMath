Class {
	#name : #PMImplicitMultiBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : #'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchAM3 [
	| solver stepper |
	stepper := PMAM3Stepper onSystem: system.
	solver := (PMAM3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchAM4 [
	| solver stepper |
	stepper := PMAM4Stepper onSystem: system.
	solver := (PMAM4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchBDF2 [
	| solver stepper |
	stepper := PMBDF2Stepper onSystem: system.
	solver := (PMBDF2Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchBDF3 [
	| solver stepper |
	stepper := PMBDF3Stepper onSystem: system.
	solver := (PMBDF3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchBDF4 [
	| solver stepper |
	stepper := PMBDF4Stepper onSystem: system.
	solver := (PMBDF4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchTrapezoidAM2 [
	| solver stepper |
	stepper := PMTrapezoidStepper onSystem: system.
	solver := (PMImplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #running }
PMImplicitMultiBenchmark >> setUp [
	super setUp.
	system := PMImplicitSystem block: function
]
