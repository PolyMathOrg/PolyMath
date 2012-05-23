solving
solve: aSystem startState: initialState startTime: initialTime endTime: endTime stepSize: timeStep
	self dt: timeStep.
	^ self solve: aSystem  startState:  initialState  startTime:  initialTime endTime: endTime.