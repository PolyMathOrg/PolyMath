"
It is stepper for Backward differentiation formulas method of order 2. We can't use BDF2 method until we have old solution value and approximate new one. A  BDF2 method is implicit. 



"
Class {
	#name : #PMBDF2Stepper,
	#superclass : #PMImplicitMultiStepper,
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMBDF2Stepper class >> order [
	"BDF2 is a second order method."
	^ 2
]

{ #category : #stepping }
PMBDF2Stepper >> doStep: aState prevState: prevState time: t [

	| approximateState |
	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	approximateState := (system state: aState time: t) * self stepSize
	                    + aState.
	^ 4 / 3 * aState - (1 / 3 * prevState) + (2 / 3 * self stepSize
	   * (system state: approximateState time: t + self stepSize))
]

{ #category : #stepping }
PMBDF2Stepper >> doStep: aState prevState: prevState time: t stepSize: timeStep [
	self stepSize: timeStep.
	^ self doStep: aState prevState: prevState time: t
]
