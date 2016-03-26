stepping
doStep3State: thirdState secondState:secondState firstState: firstState initState: initState
 thirdTime: t 
	|approximateState |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
approximateState := (system state: thirdState time: t) * self stepSize + thirdState.
	^ ((48 / 25) * thirdState) - ((36 / 25) * secondState) + ((16 / 25) * firstState) - ((3 / 25) * initState) + ((12 / 25) * self stepSize * (system state: approximateState time: t + self stepSize))