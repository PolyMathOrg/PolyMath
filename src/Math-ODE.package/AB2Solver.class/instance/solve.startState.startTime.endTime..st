as yet unclassified
solve: aSystem startState: initialState startTime: initialTime endTime: endTime
|prevState statesPair|
	self system: aSystem.
	self stepper: ((self firstStepperClass) onSystem: self system).
	state := initialState.

	"announce initial conditions"
	self announceState: state time: initialTime.
	
	prevState:= initialState.
	
	state := self firstStepState: state startTime: initialTime.
	"announce first step"
	self announceState: state time: (initialTime + dt).
	
	self stepper: ((self stepperClass) onSystem: self system).
	
	"step until the end"
	statesPair := self mainStepsState: state prevState: prevState startTime: ( initialTime + dt) endTime: endTime.

	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
		
	"take another step if needed"
	state := self lastStepState: statesPair second prevState: statesPair first endTime: endTime.

	^ state