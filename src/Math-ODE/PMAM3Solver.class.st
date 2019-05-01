"
We can't use AM3 method until we have old solution value and approximate new one. A  AM3 method is implicit. We found starting point with Trapezoidal rule.

"
Class {
	#name : #PMAM3Solver,
	#superclass : #PMImplicitSolver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAM3Solver class >> firstStepperClass [
	^ PMTrapezoidStepper
]

{ #category : #'as yet unclassified' }
PMAM3Solver class >> stepperClass [
	^ PMAM3Stepper
]

{ #category : #'as yet unclassified' }
PMAM3Solver >> firstStepStartTime: t [
	state := stepper doStep: state time: t stepSize: self dt.	
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMAM3Solver >> firstStepperClass [
	^ self class firstStepperClass
]

{ #category : #'as yet unclassified' }
PMAM3Solver >> lastStepPrevState: prevState endTime: endTime [
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
			prevState: prevState
			time: lastTime 
			deltaT: dt
			stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state
]

{ #category : #'as yet unclassified' }
PMAM3Solver >> mainStepsPrevState: prevState startTime: initialTime endTime: endTime [
	|previousState|
	previousState := prevState.	
	"don't go to end time to avoid overrunning"
	(initialTime to: endTime - self dt  by: self dt) do:
		[:time | | tempState|
			tempState := state.
			state := stepper
				doStep: state 
				prevState: previousState
				time:  time -self dt
				stepSize: self dt.
			previousState := tempState.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].
			
	^ {previousState . state}
]

{ #category : #'as yet unclassified' }
PMAM3Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
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
	
	
	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
	
	"take another step if needed"
	prevState:= statesPair first.
	state := self lastStepPrevState: prevState endTime: endTime.].

	^ state
]
