"
We can't use AM4 method until we have two old solution values and  approximate new one. A  AM4 method is implicit. We found starting point with Trapezoidal rule and next point with AM3.

"
Class {
	#name : #PMAM4Solver,
	#superclass : #PMAM3Solver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAM4Solver class >> secondStepperClass [
	^ PMAM3Stepper
]

{ #category : #private }
PMAM4Solver class >> stepperClass [
	^ PMAM4Stepper
]

{ #category : #accessing }
PMAM4Solver >> lastStepPrevState: prevState prevPrevState: prevPrevState endTime: endTime [
	"catch partial or full step at end"
	(lastTime closeTo: endTime )
	ifFalse:
		[state := stepper
			lastStep: state
				prevState: prevState
				prevPrevState: prevPrevState
				time:  lastTime
				deltaT: dt
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].
	^ state
]

{ #category : #'as yet unclassified' }
PMAM4Solver >> mainStepsPrevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime [
	|previousState previousPrevState |
	previousState := prevState.
	previousPrevState:=prevPrevState.
	"don't go to end time to avoid overrunning"
	(lastTime to: endTime - self dt  by: self dt) do:
		[:time | | tempState1 tempState2|
			tempState1 := state.
			tempState2:=previousState.
			state := stepper
				doStep: state
				prevState: previousState
				prevPrevState: previousPrevState
				time:  time
				stepSize: self dt.
			previousPrevState:=tempState2.
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].
		^ Array with: previousPrevState with: previousState
]

{ #category : #'as yet unclassified' }
PMAM4Solver >> secondStepPrevState: prevState  startTime: t [

	state := stepper doStep: state prevState: prevState time: t  stepSize: self dt.
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMAM4Solver >> secondStepperClass [
	^ self class secondStepperClass
]

{ #category : #solving }
PMAM4Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
|prevState prevPrevState statesPair |
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
		self announceState: state time:lastTime.

	      (lastTime+dt > endTime and: lastTime < endTime)
		ifTrue:[
			self stepper: ((self secondStepperClass) onSystem: self system).
			state :=self lastStepPrevState: prevState endTime: endTime].

		lastTime+dt<= endTime
		ifTrue:[
			prevPrevState := prevState.
			prevState := state.
			self stepper: ((self secondStepperClass) onSystem: self system).
			state := self secondStepPrevState: prevPrevState startTime: lastTime.
			"announce second step"
			self announceState: state time: lastTime.

			(lastTime+dt > endTime and: lastTime < endTime)
			ifTrue:[
				self stepper: ((self stepperClass) onSystem: self system).
				state := self lastStepPrevState: prevState prevPrevState:  prevPrevState endTime: endTime].

			lastTime+dt<= endTime
			ifTrue:[
				self stepper: ((self stepperClass) onSystem: self system).
					"step until the end"

				statesPair := self mainStepsPrevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime.
    				prevPrevState:=statesPair first.
				prevState:= statesPair second.


				"sanity check"
				self assert: [(lastTime between: initialTime and: endTime)
				or: [lastTime between: endTime and: initialTime]].

				"take another step if needed"
				state := self lastStepPrevState: prevState prevPrevState:  prevPrevState endTime: endTime]]].

	^ state
]
