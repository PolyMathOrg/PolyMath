"
We can't use BDF2 method until we have old solution value and approximate new one. A  BDF2 method is implicit. We found starting point with Backward Euler method.

"
Class {
	#name : #PMBDF2Solver,
	#superclass : #PMImplicitSolver,
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMBDF2Solver class >> firstStepperClass [
	^ PMImplicitStepper
]

{ #category : #private }
PMBDF2Solver class >> stepperClass [
	^ PMBDF2Stepper
]

{ #category : #accessing }
PMBDF2Solver >> firstStepStartTime: t [

	state := stepper doStep: state time: t stepSize: self dt.
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #accessing }
PMBDF2Solver >> firstStepperClass [
	^ self class firstStepperClass
]

{ #category : #accessing }
PMBDF2Solver >> lastStepPrevState: prevState endTime: endTime [
	"catch partial or full step at end"
	(lastTime closeTo: endTime )
	ifFalse:
		[state := stepper
			doStep: state
			prevState: prevState
			time: lastTime
			stepSize: endTime - lastTime.
			self announceState: state time: endTime].
	^ state
]

{ #category : #'as yet unclassified' }
PMBDF2Solver >> mainStepsPrevState: prevState startTime: initialTime endTime: endTime [
	|previousState|

	previousState := prevState.
	"don't go to end time to avoid overrunning"
	(initialTime to: endTime - self dt  by: self dt) do:
		[:time | | tempState|
			tempState := state.
			state := stepper
				doStep: state
				prevState: previousState
				time:  time
				stepSize: self dt.
			previousState := tempState.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].

	^ Array with: previousState with: state
]

{ #category : #solving }
PMBDF2Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
|prevState statesPair|
	self system: aSystem.
	self stepper: ((self firstStepperClass) onSystem: self system).
	state := initialState.
      lastTime:=initialTime.

	"announce initial conditions"
	self announceState: state time: initialTime.

(lastTime+dt > endTime and: lastTime < endTime)
	ifTrue:[
		state :=self lastStepState: state endTime: endTime].

	lastTime+dt<= endTime
	ifTrue:[
	prevState:= initialState.
	state := self firstStepStartTime: initialTime.
	"announce first step"
	self announceState: state time: initialTime + dt.

	self stepper: ((self stepperClass) onSystem: self system).

	"step until the end"
	statesPair := self mainStepsPrevState: prevState startTime: lastTime endTime: endTime.
	state:=statesPair second.
	prevState:= statesPair first .

	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime)
				or: [lastTime between: endTime and: initialTime]].

	"take another step if needed"
	state := self lastStepPrevState: prevState endTime: endTime.].

	^ state
]
