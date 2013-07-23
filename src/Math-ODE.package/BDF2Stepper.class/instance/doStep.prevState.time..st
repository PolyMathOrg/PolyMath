as yet unclassified
doStep: aState prevState: prevState time: t
	| x0 x1 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	x0 := aState.
	x1 := (system x: aState t: t) * self stepSize + x0.
	^ ((4 / 3) * x0) - ((1 / 3) * prevState) + ((2 / 3) * self stepSize * (system x: x1 t: t + self stepSize))