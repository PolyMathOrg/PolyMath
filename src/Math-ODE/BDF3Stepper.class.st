"
It is stepper for Backward differentiation formulas method of order 3.
We can't use BDF3 method until we have two old solution values and  approximate new one. A  BDF3 method is implicit. 


"
Class {
	#name : #BDF3Stepper,
	#superclass : #ImplicitMultiStepper,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
BDF3Stepper class >> order [
	"BDF3 is a third order method."
	^ 3
]

{ #category : #stepping }
BDF3Stepper >> doStep: aState prevState: prevState prevPrevState: prevPrevState time: t [ 
	|approximateState |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
approximateState := (system state: aState time: t) * self stepSize + aState.
	^ ((18 / 11) * aState) - ((9 / 11) * prevState) +((2 / 11) * prevPrevState)+ ((6 / 11) * self stepSize * (system state: approximateState time: t + self stepSize))
]

{ #category : #stepping }
BDF3Stepper >> doStep: aState prevState: prevState prevPrevState: prevPrevState time: t  stepSize: timeStep [
	self stepSize: timeStep.
	^ self doStep: aState prevState: prevState prevPrevState: prevPrevState time: t 
]
