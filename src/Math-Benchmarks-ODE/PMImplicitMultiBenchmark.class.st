Class {
	#name : #PMImplicitMultiBenchmark,
	#superclass : #PMODEBenchmark,
	#instVars : [
		'system'
	],
	#category : 'Math-Benchmarks-ODE'
}

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchAM3 [
	| solver stepper |
	stepper := AM3Stepper onSystem: system.
	solver := (AM3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchAM4 [
	| solver stepper |
	stepper := AM4Stepper onSystem: system.
	solver := (AM4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchBDF2 [
	| solver stepper |
	stepper := BDF2Stepper onSystem: system.
	solver := (BDF2Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchBDF3 [
	| solver stepper |
	stepper := BDF3Stepper onSystem: system.
	solver := (BDF3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchBDF4 [
	| solver stepper |
	stepper := BDF4Stepper onSystem: system.
	solver := (BDF4Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #benchmarking }
PMImplicitMultiBenchmark >> benchTrapezoidAM2 [
	| solver stepper |
	stepper := TrapezoidStepper onSystem: system.
	solver := (ImplicitSolver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]
]

{ #category : #'as yet unclassified' }
PMImplicitMultiBenchmark >> setUp [
	super setUp.
	system := ImplicitSystem block: function
]
