as yet unclassified
doStep: aState prevState: prevState time: t  stepSize: timeStep
	self stepSize: timeStep.
	^ self doStep: aState prevState: prevState time: t