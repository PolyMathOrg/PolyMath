stepping
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"
	self stepSize isNil ifTrue: [self error: 'step size required by stepper'].
	^ self stepSize * (system state: aState time: t) + aState
	