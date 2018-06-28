"
The implicit midpoint method is equavelent to the so-called 2nd order Gauss method.

"
Class {
	#name : #ImplicitMidpointSolver,
	#superclass : #ImplicitSolver,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
ImplicitMidpointSolver class >> stepperClass [
	^ ImplicitMidpointStepper
]

{ #category : #'as yet unclassified' }
ImplicitMidpointSolver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [

	self system: aSystem.
	stepper ifNil: [
		self stepper: ((self stepperClass) onSystem: self system)].
	state := initialState.

	"announce initial conditions"
	self announceState: state time: initialTime.
	
	
	"step until the end"

	state := self mainStepsState: state startTime: initialTime endTime: endTime.
	
	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
	
	"take another step if needed"
	state := self lastStepState: state endTime: endTime.

	^ state
]
