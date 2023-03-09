"
We can't use AB3 method until we have three old solution values. A  AB3 method is explicit. We found starting point with Midpoint Method (RK2) and the next point with AB2 method.

"
Class {
	#name : #PMAB3Solver,
	#superclass : #PMAB2Solver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAB3Solver class >> secondStepperClass [
	^ PMAB2Stepper
]

{ #category : #'as yet unclassified' }
PMAB3Solver class >> stepperClass [
	^ PMAB3Stepper
]

{ #category : #'as yet unclassified' }
PMAB3Solver >> lastStepPrevState: prevState prevPrevState: prevPrevState endTime: endTime [
	"catch partial or full step at end"
	(lastTime closeTo: endTime )
	ifFalse:
		[state := stepper
			lastStep: state
				prevState: prevState
				prevPrevState: prevPrevState
				prevPrevTime:  lastTime-(2*dt)
			      stepSize: endTime - lastTime
			      deltaT: dt.
			self announceState: state time: endTime].
	^ state
]

{ #category : #'as yet unclassified' }
PMAB3Solver >> mainStepsPrevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime [
	|previousState previousPrevState |
	previousState := prevState.
	previousPrevState:=prevPrevState.
	"don't go to end time to avoid overrunning"
	(initialTime to: endTime - (3*self dt)  by: self dt) do:
		[:time | | tempState1 tempState2|
			tempState1 := state.
			tempState2:=previousState.
			state := stepper
				doStep: state
				prevState: previousState
				prevPrevState: previousPrevState
				prevPrevTime:  time
				stepSize: self dt.
			previousPrevState:=tempState2.
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + (3*self dt)].

	^ Array with: previousPrevState with: previousState
]

{ #category : #'as yet unclassified' }
PMAB3Solver >> secondStepPrevState: prevState  startTime: t [

	state := stepper doStep: state prevState: prevState time: t  stepSize: self dt.
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMAB3Solver >> secondStepperClass [
	^ self class secondStepperClass
]

{ #category : #'as yet unclassified' }
PMAB3Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
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
