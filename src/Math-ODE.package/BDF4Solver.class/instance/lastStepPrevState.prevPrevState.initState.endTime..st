as yet unclassified
lastStepPrevState: prevState prevPrevState: prevPrevState initState:initState endTime: endTime
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			doStep3State: state 
				secondState: prevState
				firstState: prevPrevState
				initState: initState
				thirdTime:  lastTime
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state