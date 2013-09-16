as yet unclassified
doStep: aState prevState: prevState time: t
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	^ (self stepSize / 2) * (3 * (system x: aState t: t) - (system x: prevState t: t - self stepSize)) + aState