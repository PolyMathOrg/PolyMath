as yet unclassified
lastStepState: aState prevState: prevState prevPrevState: prevPrevState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			lastStep: state 
				prevState: prevState
				prevPrevState: prevPrevState
				prevPrevTime:  lastTime-(2*dt) 
			      stepSize: endTime - lastTime
			      deltaT: dt.
			self announceState: state time: endTime].			
	^ state