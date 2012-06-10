solving
lastStepState: aState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			doStep: state 
			time: lastTime 
			stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state