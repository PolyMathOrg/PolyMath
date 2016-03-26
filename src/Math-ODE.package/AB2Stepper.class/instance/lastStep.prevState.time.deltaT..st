stepping
lastStep: aState prevState: prevState time: t deltaT: incrementOfTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].

	^ self stepSize / 2 * (3 * (system state: aState time: t) - (system state: prevState time: t - incrementOfTime)) + aState