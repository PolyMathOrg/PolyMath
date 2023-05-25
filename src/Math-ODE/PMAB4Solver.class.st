"
We can't use AB4 method until we have four old solution values. A  AB4 method is explicit. We found starting point with Midpoint Method (RK2) and the next points with AB2 and AB3 methods.

"
Class {
	#name : #PMAB4Solver,
	#superclass : #PMAB3Solver,
	#category : #'Math-ODE'
}

{ #category : #private }
PMAB4Solver class >> stepperClass [
	^ PMAB4Stepper
]

{ #category : #'as yet unclassified' }
PMAB4Solver class >> thirdStepperClass [
	^ PMAB3Stepper
]

{ #category : #accessing }
PMAB4Solver >> lastStepPrevState: prevState prevPrevState: prevPrevState initState:initState endTime: endTime [
	"catch partial or full step at end"
	(lastTime closeTo: endTime )
	ifFalse:
		[state := stepper
			lastStep: state
				secondState: prevState
				firstState: prevPrevState
				initState: initState
				initTime:  lastTime-(3*dt)
			      deltaT: dt
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].
	^ state
]

{ #category : #'as yet unclassified' }
PMAB4Solver >> mainStepsPrevState: prevState prevPrevState: prevPrevState initState: initState  startTime: initialTime endTime: endTime [
	|previousState previousPrevState initialState |

	previousState := prevState.
	previousPrevState:=prevPrevState.
	initialState:=initState.
	"don't go to end time to avoid overrunning"
	(initialTime to: endTime - (4*self dt)  by: self dt) do:
		[:time | | tempState1 tempState2 tempState3|

			tempState1:=state.
			tempState2:=previousState.
			tempState3:=previousPrevState.
			state := stepper
				doStep3State: state
				secondState: previousState
				firstState: previousPrevState
				initState: initState
				initTime: time
				stepSize: self dt.
			initialState:=tempState3.
			previousPrevState:=tempState2.
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + (4*self dt)].

	^ Array with: initialState with: previousPrevState with: previousState
]

{ #category : #solving }
PMAB4Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
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
									initState:=statesPair first.
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
PMAB4Solver >> thirdStepPrevState: prevState prevPrevState: prevPrevState  startTime: t [
	state := stepper doStep: state
				   prevState: prevState
				   prevPrevState: prevPrevState
				   prevPrevTime: t-(2*self dt)
				   stepSize: self dt.
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMAB4Solver >> thirdStepperClass [
	^ self class thirdStepperClass
]
