stepping
doStep: aState time: t stepSize: timeStep
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Beckward Euler Method with prediction made by forward Euler. "
	self stepSize: timeStep.
	^ self doStep: aState  time:  t.