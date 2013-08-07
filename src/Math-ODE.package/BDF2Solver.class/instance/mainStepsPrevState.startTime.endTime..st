as yet unclassified
mainStepsPrevState: prevState startTime: initialTime endTime: endTime
	|previousState|

	previousState := prevState.	
	"don't go to end time to avoid overrunning"
	(initialTime to: endTime - self dt  by: self dt) do:
		[:time | | tempState|
			tempState := state.
			state := stepper
				doStep: state 
				prevState: previousState
				time:  time 
				stepSize: self dt.
			previousState := tempState.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].
			
	^ {previousState . state}