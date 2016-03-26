as yet unclassified
doStep: aState prevState: prevState time: t
	|approximateState |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
approximateState := (system state: aState time: t) * self stepSize + aState.
	^ ((4 / 3) * aState) - ((1 / 3) * prevState) + ((2 / 3) * self stepSize * (system state: approximateState time: t + self stepSize))