"
We can't use BDF4 method until we have three old solution values and  approximate new one. A  BDF4 method is implicit. We found starting point with Backward Euler method and next points with BDF2 and BDF3.

"
Class {
	#name : #PMBDF4Solver,
	#superclass : #PMBDF3Solver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMBDF4Solver class >> stepperClass [
	^ PMBDF4Stepper
]

{ #category : #'as yet unclassified' }
PMBDF4Solver class >> thirdStepperClass [
	^ PMBDF3Stepper
]

{ #category : #'as yet unclassified' }
PMBDF4Solver >> lastStepPrevState: prevState prevPrevState: prevPrevState initState:initState endTime: endTime [
	"catch partial or full step at end"
	(lastTime closeTo: endTime )
	ifFalse:
		[state := stepper
			doStep3State: state
				secondState: prevState
				firstState: prevPrevState
				initState: initState
				thirdTime:  lastTime
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].
	^ state
]

{ #category : #'as yet unclassified' }
PMBDF4Solver >> mainStepsPrevState: prevState prevPrevState: prevPrevState initState: initState  startTime: initialTime endTime: endTime [
	|previousState previousPrevState initialState |

	previousState := prevState.
	previousPrevState:=prevPrevState.
	initialState:=initState.
	"don't go to end time to avoid overrunning"
	(lastTime to: endTime - self dt  by: self dt) do:
		[:time | | tempState1 tempState2 tempState3|

			tempState1:=state.
			tempState2:=previousState.
			tempState3:=previousPrevState.
			state := stepper
				doStep3State: state
				secondState: previousState
				firstState: previousPrevState
				initState: initialState
				thirdTime: time
				stepSize: self dt.
			initialState:=tempState3.
			previousPrevState:=tempState2.
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].

	^ Array with: initialState with: previousPrevState with: previousState
]

{ #category : #'as yet unclassified' }
PMBDF4Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
	| prevState prevPrevState statesPair initState |
	self system: aSystem.
	self stepper: (self firstStepperClass onSystem: self system).
	state := initialState.
	lastTime := initialTime.
		"announce initial conditions"
	self announceState: state time: initialTime.

	(lastTime + dt > endTime and: lastTime < endTime)
		ifTrue: [ state := self lastStepState: state endTime: endTime ].

	lastTime + dt <= endTime
		ifTrue: [
			prevState := initialState.
			state := self firstStepStartTime: initialTime.
				"announce first step"
			self announceState: state time: lastTime.

			(lastTime + dt > endTime and: lastTime < endTime)
				ifTrue: [
					self stepper: (self secondStepperClass onSystem: self system).
					state := self lastStepPrevState: prevState endTime: endTime ].

			lastTime + dt <= endTime
				ifTrue: [
					prevPrevState := prevState.
					prevState := state.
					self stepper: (self secondStepperClass onSystem: self system).
					state := self secondStepPrevState: prevPrevState startTime: lastTime.
						"announce second step"
					self announceState: state time: lastTime.

					(lastTime + dt > endTime and: lastTime < endTime)
						ifTrue: [ self stepper: (self thirdStepperClass onSystem: self system).
							state := self
								lastStepPrevState: prevState
								prevPrevState: prevPrevState
								endTime: endTime ].

					lastTime + dt <= endTime
						ifTrue: [
							self stepper: (self thirdStepperClass onSystem: self system).
                                          initState := prevPrevState.
							prevPrevState := prevState.
							prevState := state.
							state := self
								thirdStepPrevState: prevPrevState
								prevPrevState: initState
								startTime: lastTime.

								"announce third step"
							self announceState: state time: lastTime.

							(lastTime + dt > endTime and: lastTime < endTime)
								ifTrue: [
									self stepper: (self stepperClass onSystem: self system).
									state := self
										lastStepPrevState: prevState
										prevPrevState: prevPrevState
										initState: initState
										endTime: endTime ].

							lastTime + dt <= endTime
								ifTrue: [
									self stepper: (self stepperClass onSystem: self system).
										"step until the end"

									statesPair := self
										mainStepsPrevState: prevState
										prevPrevState: prevPrevState
										initState: initState
										startTime: initialTime
										endTime: endTime.
									initState := statesPair first.
									prevPrevState:=statesPair second.
									prevState:= statesPair third.


										"sanity check"
									self
										assert: [ (lastTime between: initialTime and: endTime) or: [ lastTime between: endTime and: initialTime ] ].


											"take another step if needed"
									state := self
										lastStepPrevState: prevState
										prevPrevState: prevPrevState
										initState: initState
										endTime: endTime ] ] ] ].
	^ state
]

{ #category : #'as yet unclassified' }
PMBDF4Solver >> thirdStepPrevState: prevState prevPrevState: prevPrevState  startTime: t [
	state := stepper doStep: state
				   prevState: prevState
				   prevPrevState: prevPrevState
				   time: t
				   stepSize: self dt.
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMBDF4Solver >> thirdStepperClass [
	^ self class thirdStepperClass
]
