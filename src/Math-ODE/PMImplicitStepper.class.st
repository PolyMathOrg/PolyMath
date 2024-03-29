"
For some kind of systems the stability properties of the classical Runge-Kutta are not sufficient, especially if the system is said to be stiff. A stiff system possesses two or more time scales of very different order. Solvers for stiff systems are usually implicit, meaning that they solve equations like x(t+dt) = x(t) + dt * f(x(t+1)). This particular scheme is the implicit euler method. Implicit methods usually solve the system of equations by a root finding algorithm like the Newton method and therefore need to know the Jacobian of the system.

For implicit solvers the system is again a pair, where the first component computes f(x,t) and the second the Jacobian. ons of motion to 
"
Class {
	#name : #PMImplicitStepper,
	#superclass : #PMStepper,
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMImplicitStepper class >> order [
	"the default ImplicitStepper is a Backward Euler Method, order 1"
	^ 1
]

{ #category : #stepping }
PMImplicitStepper >> doStep: aState time: t [

	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Backward Euler Method with prediction made by forward Euler."

	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	^ self stepSize
	  * (system state: aState + self stepSize time: t + self stepSize)
	  + aState
]

{ #category : #stepping }
PMImplicitStepper >> doStep: aState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Beckward Euler Method with prediction made by forward Euler. "
	self stepSize: timeStep.
	^ self doStep: aState  time:  t
]

{ #category : #stepping }
PMImplicitStepper >> lastStep: aState time: t deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Backward Euler Method with prediction made by forward Euler."

	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	^ self stepSize * (system state: aState + incrementOfTime time: t + incrementOfTime) + aState
]

{ #category : #stepping }
PMImplicitStepper >> lastStep: aState time: t stepSize: timeStep deltaT: incrementOfTime [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Beckward Euler Method with prediction made by forward Euler. "
	self stepSize: timeStep.
	^ self lastStep: aState  time:  t deltaT: incrementOfTime
]
