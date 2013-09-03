as yet unclassified
lastStep: aState prevState: prevState time: t deltaT: incrementOfTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].

	^ self stepSize / 2 * (3 * (system x: aState t: t) - (system x: prevState t: t - incrementOfTime)) + aState