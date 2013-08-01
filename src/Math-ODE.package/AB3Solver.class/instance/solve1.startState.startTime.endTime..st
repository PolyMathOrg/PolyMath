as yet unclassified
solve1: aSystem startState: initialState startTime: initialTime endTime: endTime
|prevState prevPrevState statesPair |
	self system: aSystem.
	self stepper: ((self firstStepperClass) onSystem: self system).
	state := initialState.
      lastTime:=initialTime.
	"announce initial conditions"
	self announceState: state time: initialTime.
	
	(lastTime+dt > endTime and: lastTime < endTime)
	ifTrue:[
		state :=self lastStepState: state endTime: endTime].
	
	lastTime+dt<= endTime 
	ifTrue:[
		prevState:= initialState.
		state := self firstStepState: state startTime: initialTime.
		"announce first step"
		self announceState: state time:lastTime.    
	
	      (lastTime+dt > endTime and: lastTime < endTime)
		ifTrue:[
			state :=self lastStepState: state prevState: prevState endTime: endTime].
		
		lastTime+dt<= endTime 
		ifTrue:[
			prevPrevState := prevState.
			prevState := state.
			self stepper: ((self secondStepperClass) onSystem: self system).
			state := self secondStepState: prevState prevState: prevPrevState startTime: lastTime.  
			"announce second step"
			self announceState: state time: lastTime.    
			
			(lastTime+dt > endTime and: lastTime < endTime)
			ifTrue:[state := self lastStepState: state prevState: prevState prevPrevState:  prevPrevState endTime: endTime].
			
			lastTime+dt<= endTime 
			ifTrue:[
				self stepper: ((self stepperClass) onSystem: self system).
					"step until the end"                                                                            
				statesPair := self mainStepsState: state prevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime.
    				prevPrevState:=prevState.

				"sanity check"
				self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
		
				"take another step if needed"                                                                
				state := self lastStepState: statesPair second prevState: statesPair first prevPrevState:  prevPrevState endTime: endTime]]].
   		 
	^ state  