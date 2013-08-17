as yet unclassified
lastStepPrevState: prevState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
			prevState: prevState
			time: lastTime 
			deltaT: dt
			stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state