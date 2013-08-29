stepping
lastStep: aState time: t stepSize: timeStep deltaT: incrementOfTime
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"
	| |
	self stepSize: timeStep.
	^ self lastStep: aState  time:  t deltaT: incrementOfTime.