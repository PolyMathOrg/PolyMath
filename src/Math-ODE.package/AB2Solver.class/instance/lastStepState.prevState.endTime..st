solving
lastStepState: aState prevState: prevState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			doStep: state 
			prevState: prevState
			time: lastTime 
			stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state