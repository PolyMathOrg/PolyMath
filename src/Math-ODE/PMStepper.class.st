"
Basic steppers execute one timestep of a specific order with a given stepsize.

From odeint-v2 documentation:

Solving ordinary differential equation numerically is usually done iteratively, that is a given state of an ordinary differential equation is iterated forward x(t) -> x(t+dt) -> x(t+2dt). Steppers perform one single step. The most general stepper type is described by the Stepper concept.

Before calling doStep, it is important to associate the stepper with a system. The class method onSystem will assign the system to the Stepper.



"
Class {
	#name : #PMStepper,
	#superclass : #Object,
	#instVars : [
		'system',
		'dt'
	],
	#category : #'Math-ODE'
}

{ #category : #'instance creation' }
PMStepper class >> onSystem: aSystem [ 
	^ self new system: aSystem. 
]

{ #category : #accessing }
PMStepper class >> order [
	"Answer the order of this stepper, which is undefined by default. Subclasses should override with their details."
	^ nil
]

{ #category : #stepping }
PMStepper >> doStep: aState time: t stepSize: dt [
	"This method should take one step from inState at time t of size dt, then answer it"
	self subclassResponsibility 
]

{ #category : #accessing }
PMStepper >> order [
	^ self class order
]

{ #category : #accessing }
PMStepper >> stepSize [
	^ dt.
]

{ #category : #accessing }
PMStepper >> stepSize: timeStep [
	dt := timeStep.
]

{ #category : #accessing }
PMStepper >> system [
	^ system
]

{ #category : #accessing }
PMStepper >> system: aSystem [
	system := aSystem.
]
