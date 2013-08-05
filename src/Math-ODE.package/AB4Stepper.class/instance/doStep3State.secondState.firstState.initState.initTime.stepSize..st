as yet unclassified
doStep3State: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime  stepSize: timeStep
	self stepSize: timeStep.
	^ self doStep3State: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime  .