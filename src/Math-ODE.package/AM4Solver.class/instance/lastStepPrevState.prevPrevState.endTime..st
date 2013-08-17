as yet unclassified
lastStepPrevState: prevState prevPrevState: prevPrevState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
				prevState: prevState
				prevPrevState: prevPrevState
				time:  lastTime
				deltaT: dt 
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state