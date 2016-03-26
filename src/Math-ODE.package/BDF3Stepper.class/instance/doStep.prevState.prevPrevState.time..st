stepping
doStep: aState prevState: prevState prevPrevState: prevPrevState time: t 
	|approximateState |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
approximateState := (system state: aState time: t) * self stepSize + aState.
	^ ((18 / 11) * aState) - ((9 / 11) * prevState) +((2 / 11) * prevPrevState)+ ((6 / 11) * self stepSize * (system state: approximateState time: t + self stepSize))