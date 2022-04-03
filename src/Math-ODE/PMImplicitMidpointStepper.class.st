"
The implicit midpoint method is equavelent to the so-called 2nd order Gauss method.

"
Class {
	#name : #PMImplicitMidpointStepper,
	#superclass : #PMImplicitStepper,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMImplicitMidpointStepper class >> order [
	"Implicit Midpoint is a second order method."
	^ 2
]

{ #category : #stepping }
PMImplicitMidpointStepper >> doStep: aState time: t [

	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	| xi1 xi2 ti |
	self stepSize ifNil: [ self error: 'step size required by stepper' ].

	ti := t + (1 / 2 * self stepSize).
	xi1 := aState + (self stepSize * (system state: aState time: t)).
	xi2 := 1 / 2 * (aState + (system state: xi1 time: ti)).
	^ aState + (self stepSize * (system state: xi2 time: ti))
]

{ #category : #stepping }
PMImplicitMidpointStepper >> doStep: aState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	self stepSize: timeStep.
	^ self doStep: aState  time:  t.
]
