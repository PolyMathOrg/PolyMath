"
We can't use AB2 method until we have two old solution values. A  AB2 method is explicit. We found starting point with Midpoint Method (RK2).

"
Class {
	#name : #PMAB2Solver,
	#superclass : #PMExplicitSolver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAB2Solver class >> firstStepperClass [
	^ PMMidpointStepper
]

{ #category : #'as yet unclassified' }
PMAB2Solver class >> stepperClass [
	^ PMAB2Stepper
]

{ #category : #'as yet unclassified' }
PMAB2Solver >> firstStepStartTime: t [
	state := stepper doStep: state time: t stepSize: self dt.	
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMAB2Solver >> firstStepperClass [
	^ self class firstStepperClass 
]

{ #category : #solving }
PMAB2Solver >> lastStepPrevState: prevState endTime: endTime [
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
			prevState: prevState
			time: lastTime 
			stepSize: endTime - lastTime
			deltaT: dt.
			self announceState: state time: endTime].			
	^ state
]

{ #category : #'as yet unclassified' }
PMAB2Solver >> mainStepsPrevState: prevState startTime: initialTime endTime: endTime [
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

{ #category : #'as yet unclassified' }
PMAB2Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
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
	self announceState: state time: (initialTime + dt).
	
	self stepper: ((self stepperClass) onSystem: self system).
	
	"step until the end"
	statesPair := self mainStepsPrevState: prevState startTime: ( initialTime + dt) endTime: endTime.
      state:=statesPair second.
	prevState:= statesPair first.
	
	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
		
	"take another step if needed"
	state := self lastStepPrevState: prevState endTime: endTime.].

	^ state
]
