solving
solve: aSystem startState: initialState startTime: initialTime endTime: endTime

	self system: aSystem.
	stepper ifNil: [
		self stepper: ((self stepperClass) onSystem: self system)].
	state := initialState.

	"announce initial conditions"
	self announceState: state time: initialTime.
	"step until the end"
	state := self mainStepsState: state startTime: initialTime endTime: endTime.
	
	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
	
	"take another step if needed"
	state := self lastStepState: state endTime: endTime.

	^ state