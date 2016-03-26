as yet unclassified
doStep: aState prevState: prevState time: t
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	^ (self stepSize / 2) * (3 * (system state: aState time: t) - (system state: prevState time: t - self stepSize)) + aState