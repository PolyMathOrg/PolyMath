"
It is stepper for Adams - Bashforth method of order 4. We can't use AB4 method until we have three old solution values. A AB4 method is explicit.

"
Class {
	#name : #PMAB4Stepper,
	#superclass : #PMExplicitMultiStepper,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAB4Stepper class >> order [
	"AB4 is a fourth order method."
	^ 4
]

{ #category : #stepping }
PMAB4Stepper >> doStep3State: thirdState secondState: secondState firstState: firstState initState: initState initTime: initTime [

	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	^ self stepSize * (55 / 24
	   * (system state: thirdState time: initTime + (3 * self stepSize))
	   - (59 / 24
		    *
		    (system state: secondState time: initTime + (2 * self stepSize)))
	   +
	   (37 / 24
	    * (system state: firstState time: initTime + self stepSize))
	   - (3 / 8 * (system state: initState time: initTime))) + thirdState
]

{ #category : #stepping }
PMAB4Stepper >> doStep3State: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime  stepSize: timeStep [
	self stepSize: timeStep.
	^ self doStep3State: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime
]

{ #category : #stepping }
PMAB4Stepper >> lastStep: thirdState secondState: secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime [

	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	^ self stepSize * (55 / 24
	   *
	   (system state: thirdState time: initTime + (3 * incrementOfTime))
	   - (59 / 24
		    *
		    (system
			     state: secondState
			     time: initTime + (2 * incrementOfTime)))
	   +
	   (37 / 24
	    * (system state: firstState time: initTime + incrementOfTime))
	   - (3 / 8 * (system state: initState time: initTime))) + thirdState
]

{ #category : #stepping }
PMAB4Stepper >> lastStep: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime stepSize: timeStep [

	self stepSize: timeStep.
	^ self lastStep: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime
]
