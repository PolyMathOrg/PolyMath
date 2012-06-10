solving
mainStepsState: aState startTime: initialTime endTime: endTime
	state := aState.	
	"don't go to end time to avoid overrunning"
	(initialTime to: endTime - self dt  by: self dt) do:
		[:time | 
			state := stepper 
				doStep: state 
				time:  time 
				stepSize: self dt.
				"announce step results"
				self announceState: state time: time + self dt.
				lastTime := time + self dt].
			
	^ state