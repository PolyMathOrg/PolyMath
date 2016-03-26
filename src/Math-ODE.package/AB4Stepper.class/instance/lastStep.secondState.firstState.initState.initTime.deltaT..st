as yet unclassified
lastStep: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (55/24) * (system state: thirdState time:  initTime+ (3* incrementOfTime) )) - ((59/24)*(system state: secondState time: initTime+ (2* incrementOfTime))) + ((37/24)*(system state: firstState time: initTime+ incrementOfTime ) )-   ((3/8)*(system state: initState time: initTime ) )) + thirdState.
