"
Explicit steppers

A first specialization are the explicit steppers. Explicit means that the new state of the ode can be computed explicitly from the current state without solving implicit equations. These steppers have in common that they evaluate the system at time t such that the result of f(x,t) can be passed to the stepper. In odeint, the explicit stepper have two additional methods

do_step( sys , inout , dxdtin , t , dt )

do_step( sys , in , dxdtin , t , out , dt )

Here, the additional parameter is the value of the function f at state x and time t.
"
Class {
	#name : #PMExplicitStepper,
	#superclass : #PMStepper,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMExplicitStepper class >> order [
	"the default ExplicitStepper is a Euler Method, order 1"
	^ 1
]

{ #category : #stepping }
PMExplicitStepper >> doStep: aState time: t [

	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"

	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	^ self stepSize * (system state: aState time: t) + aState
]

{ #category : #stepping }
PMExplicitStepper >> doStep: aState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"

	self stepSize: timeStep.
	^ self doStep: aState time: t
]

{ #category : #stepping }
PMExplicitStepper >> lastStep: aState time: t deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"

	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	^ self stepSize * (system state: aState time: t - self stepSize + incrementOfTime) + aState
]

{ #category : #stepping }
PMExplicitStepper >> lastStep: aState time: t stepSize: timeStep deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"
	| |
	self stepSize: timeStep.
	^ self lastStep: aState  time:  t deltaT: incrementOfTime.
]
