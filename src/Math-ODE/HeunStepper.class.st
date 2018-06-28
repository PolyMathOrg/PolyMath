"
Heun's method may refer to the improved or modified Euler's method (that is, the explicit trapezoidal rule), or a similar two-stage Runge-Kutta method. 

"
Class {
	#name : #HeunStepper,
	#superclass : #ExplicitStepper,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
HeunStepper class >> order [
	"Heun's method is a second order method."
	^ 2
]

{ #category : #stepping }
HeunStepper >> doStep: aState time: t [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	| xi ti  |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	ti := t + self stepSize.
	xi := aState + (self stepSize * (system state: aState time: t)).
	 ^aState + ((self stepSize / 2) * (  (system state: aState time: t) + (system state: xi time: ti) ) ).
	
]

{ #category : #stepping }
HeunStepper >> doStep: aState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	self stepSize: timeStep.
	^ self doStep: aState  time:  t.
]
