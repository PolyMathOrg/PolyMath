as yet unclassified
lastStep: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime stepSize: timeStep

	self stepSize: timeStep.
	^ self lastStep: thirdState secondState:secondState firstState: firstState initState: initState initTime: initTime deltaT: incrementOfTime .
