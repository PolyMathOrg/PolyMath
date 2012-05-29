solving
solve: aSystem startState: initialState startTime: initialTime endTime: endTime
	| state |
	self system: aSystem.
	stepper ifNil: [
		self stepper: ((self stepperClass) onSystem: self system)].
	state := initialState.
	(initialTime to: endTime by: self dt) do:
		[:time | 
			state := stepper 
				doStep: state 
				time:  time 
				stepSize: self dt.
			self fixMe: 'add a monitor method/announcement here'.
		].
	^ state