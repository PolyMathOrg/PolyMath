as yet unclassified
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Backward Euler Method with prediction made by forward Euler."
	self stepSize isNil ifTrue: [self error: 'step size required by stepper'].
	^ (self stepSize * (system state: (aState+self stepSize) time: (t+self stepSize))) + aState
