solving
lastStepState: aState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
			time: lastTime 
			stepSize: endTime - lastTime
			deltaT: dt.
			self announceState: state time: endTime].			
	^ state