as yet unclassified
doStep3State: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (55/24) * (system x: thirdState t:  initTime+ (3* self stepSize) )) - ((59/24)*(system x: secondState t: initTime+ (2* self stepSize))) + ((37/24)*(system x: firstState t: initTime+ self stepSize ) )-   ((3/8)*(system x: initState t: initTime ) )) + thirdState.