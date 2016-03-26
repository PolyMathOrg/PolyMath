stepping
doStep3State: thirdState secondState:secondState firstState: firstState initState: initState
 thirdTime: t stepSize: timeStep
	self stepSize: timeStep.
	^ self doStep3State: thirdState secondState:secondState firstState: firstState initState: initState thirdTime: t