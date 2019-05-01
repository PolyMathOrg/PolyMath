"
The trapezoidal rule is an implicit second-order method, which can be considered as both a Runge-Kutta method and a linear multistep method. It is Adams - Moulton method of order 2.



"
Class {
	#name : #PMTrapezoidStepper,
	#superclass : #PMImplicitMultiStepper,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMTrapezoidStepper class >> order [
	"Trapezoid is a second order method."
	^ 2
]

{ #category : #stepping }
PMTrapezoidStepper >> doStep: aState time: t [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	| xi1 xi2 ti |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].	
	ti := t + self stepSize.
	xi1 := aState + (self stepSize * (system state: aState time: t)).
	xi2 := aState + ((1 / 2) * self stepSize * ((system state: aState time: t) + (system state: xi1 time: ti))).
	^ aState + ((1 / 2) * self stepSize * ((system state: aState time: t) + (system state: xi2 time: ti)))
]

{ #category : #stepping }
PMTrapezoidStepper >> doStep: aState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	self stepSize: timeStep.
	^ self doStep: aState  time:  t.
]

{ #category : #stepping }
PMTrapezoidStepper >> lastStep: aState time: t deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	| xi1 xi2 ti |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].	
	ti := t + incrementOfTime.
	xi1 := aState + (self stepSize * (system state: aState time: t)).
	xi2 := aState + ((1 / 2) * self stepSize * ((system state: aState time: t) + (system state: xi1 time: ti))).
	^ aState + ((1 / 2) * self stepSize * ((system state: aState time: t) + (system state: xi2 time: ti)))
]

{ #category : #stepping }
PMTrapezoidStepper >> lastStep: aState time: t stepSize: timeStep deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	self stepSize: timeStep.
	^ self lastStep: aState  time:  t deltaT: incrementOfTime.
]
