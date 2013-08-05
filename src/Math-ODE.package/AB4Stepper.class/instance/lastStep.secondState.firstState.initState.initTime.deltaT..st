as yet unclassified
lastStep: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (55/24) * (system x: thirdState t:  initTime+ (3* incrementOfTime) )) - ((59/24)*(system x: secondState t: initTime+ (2* incrementOfTime))) + ((37/24)*(system x: firstState t: initTime+ incrementOfTime ) )-   ((3/8)*(system x: initState t: initTime ) )) + thirdState.
