as yet unclassified
lastStepPrevState: prevState prevPrevState: prevPrevState initState:initState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
				secondState: prevState
				firstState: prevPrevState
				initState: initState
				initTime:  lastTime-(3*dt) 
			      deltaT: dt 
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state