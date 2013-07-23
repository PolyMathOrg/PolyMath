as yet unclassified
firstStepState: aState startTime: t
	state := aState.
	state := stepper doStep: state time: t stepSize: self dt.	
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state