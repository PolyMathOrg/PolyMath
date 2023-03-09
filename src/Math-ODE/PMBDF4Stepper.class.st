"
It is stepper for Backward differentiation formulas method of order 3.
We can't use BDF4 method until we have three old solution values and  approximate new one. A  BDF4 method is implicit. 

"
Class {
	#name : #PMBDF4Stepper,
	#superclass : #PMImplicitMultiStepper,
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMBDF4Stepper class >> order [
	"BDF4 is a fourth order method."
	^ 4
]

{ #category : #stepping }
PMBDF4Stepper >> doStep3State: thirdState secondState: secondState firstState: firstState initState: initState thirdTime: t [

	| approximateState |
	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	approximateState := (system state: thirdState time: t)
	                    * self stepSize + thirdState.
	^ 48 / 25 * thirdState - (36 / 25 * secondState)
	  + (16 / 25 * firstState) - (3 / 25 * initState)
	  + (12 / 25 * self stepSize
		   * (system state: approximateState time: t + self stepSize))
]

{ #category : #stepping }
PMBDF4Stepper >> doStep3State: thirdState secondState:secondState firstState: firstState initState: initState
 thirdTime: t stepSize: timeStep [
	self stepSize: timeStep.
	^ self doStep3State: thirdState secondState:secondState firstState: firstState initState: initState thirdTime: t
]
