as yet unclassified
doStep3State: thirdState secondState:secondState firstState: firstState initState: initState
 thirdTime: t 
	|approximateState |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
approximateState := (system x: thirdState t: t) * self stepSize + thirdState.
	^ ((48 / 25) * thirdState) - ((36 / 25) * secondState) + ((16 / 25) * firstState) - ((3 / 25) * initState) + ((12 / 25) * self stepSize * (system x: approximateState t: t + self stepSize))