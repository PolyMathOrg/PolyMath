as yet unclassified
lastStep: aState  prevState: prevState time: t deltaT: incrementOfTime stepSize: timeStep
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	self stepSize: timeStep.
	^ self lastStep: aState  prevState: prevState time:  t- timeStep  deltaT: incrementOfTime.