solving
lastStepPrevState: prevState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
			prevState: prevState
			time: lastTime 
			stepSize: endTime - lastTime
			deltaT: dt.
			self announceState: state time: endTime].			
	^ state