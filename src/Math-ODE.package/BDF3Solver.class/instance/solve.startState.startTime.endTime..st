as yet unclassified
solve: aSystem startState: initialState startTime: initialTime endTime: endTime
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
		state := self firstStepStartTime: initialTime.
		"announce first step"
		self announceState: state time:lastTime.    
	
	      (lastTime+dt > endTime and: lastTime < endTime)
		ifTrue:[
			self stepper: ((self secondStepperClass) onSystem: self system).
			state :=self lastStepPrevState: prevState endTime: endTime].
		
		lastTime+dt<= endTime 
		ifTrue:[
			prevPrevState := prevState.
			prevState := state.
			self stepper: ((self secondStepperClass) onSystem: self system).
			state := self secondStepPrevState: prevPrevState startTime: lastTime.  
			"announce second step"
			self announceState: state time: lastTime.    
			
			(lastTime+dt > endTime and: lastTime < endTime)
			ifTrue:[
				self stepper: ((self stepperClass) onSystem: self system).
				state := self lastStepPrevState: prevState prevPrevState:  prevPrevState endTime: endTime].
			
			lastTime+dt<= endTime 
			ifTrue:[
				self stepper: ((self stepperClass) onSystem: self system).
					"step until the end"  
		                                                                                     
				statesPair := self mainStepsPrevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime.
    				prevPrevState:=statesPair first.
				prevState:= statesPair second.
				state:= statesPair third.

				"sanity check"
				self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
		
				"take another step if needed"                                                                
				state := self lastStepPrevState: prevState prevPrevState:  prevPrevState endTime: endTime]]].
   		 
	^ state  