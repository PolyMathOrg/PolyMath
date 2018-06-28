"
The midpoint method is also known as the modified Euler method or RK2. It is an explicit method.

"
Class {
	#name : #MidpointStepper,
	#superclass : #ExplicitStepper,
	#category : 'Math-ODE'
}

{ #category : #accessing }
MidpointStepper class >> order [
	"Midpoint is a second order method."
	^ 2
]

{ #category : #stepping }
MidpointStepper >> doStep: aState time: t [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	| k1 k2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	k1 := system state: aState time: t.
	k2 := system state: (aState + (self stepSize*(1/ 2)* k1)) time: t + (self stepSize *(1/ 2)).
	^ aState + (k2 * self stepSize).
	
]

{ #category : #stepping }
MidpointStepper >> lastStep: aState time: t stepSize: timeStep deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	self stepSize: timeStep.
	^ self doStep: aState time: t .
	
]
