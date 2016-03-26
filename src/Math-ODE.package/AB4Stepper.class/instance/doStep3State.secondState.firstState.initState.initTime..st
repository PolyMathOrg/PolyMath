stepping
doStep3State: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (55/24) * (system state: thirdState time:  initTime+ (3* self stepSize) )) - ((59/24)*(system state: secondState time: initTime+ (2* self stepSize))) + ((37/24)*(system state: firstState time: initTime+ self stepSize ) )-   ((3/8)*(system state: initState time: initTime ) )) + thirdState.