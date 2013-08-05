as yet unclassified
solve: aSystem startState: initialState startTime: initialTime endTime: endTime
|prevState statesPair|
	self system: aSystem.
	self stepper: ((self firstStepperClass) onSystem: self system).
	state := initialState.

	"announce initial conditions"
	self announceState: state time: initialTime.
	
	prevState:= initialState.
	
	state := self firstStepStartTime: initialTime.
	"announce first step"
	self announceState: state time: (initialTime + dt).
	
	self stepper: ((self stepperClass) onSystem: self system).
	
	"step until the end"
	statesPair := self mainStepsPrevState: prevState startTime: ( initialTime + dt) endTime: endTime.
      state:=statesPair second.
	prevState:= statesPair first.
	
	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
		
	"take another step if needed"
	state := self lastStepPrevState: prevState endTime: endTime.

	^ state