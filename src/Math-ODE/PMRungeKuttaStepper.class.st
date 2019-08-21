"
A RungeKuttaStepper is a specialization on Explicit Stepper that provides a higer order estimate. The Euler method implemented in ExplicitStepper is order 1, and the error obtained is proportional to the step size.

The RungeKuttaStepper is order 4, the error term is proportional to the step size to the fourth power.
"
Class {
	#name : #PMRungeKuttaStepper,
	#superclass : #PMExplicitStepper,
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMRungeKuttaStepper class >> order [
	"RungeKutta is a fourth order method."
	^ 4
]

{ #category : #stepping }
PMRungeKuttaStepper >> doStep: aState time: t [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	| k1 k2 k3 k4 midPoint endPoint |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	midPoint := self stepSize / 2 + t.
	endPoint := self stepSize + t.
	k1 := system state: aState time: t.
	k2 := system state: aState + (k1 * self stepSize / 2) time: midPoint.
	k3 := system state: aState + (k2 * self stepSize / 2) time: midPoint.
	k4 := system state: aState + (k3 * self stepSize) time: endPoint.
	^ aState + ((k1 + k2 + k2 + k3 + k3 + k4) / 6 * self stepSize)
]

{ #category : #stepping }
PMRungeKuttaStepper >> lastStep: aState time: t stepSize: timeStep deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	self stepSize: timeStep.
	^ self doStep: aState time: t 
]
