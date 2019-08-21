"
We can't use BDF3 method until we have two old solution values and  approximate new one. A  BDF3 method is implicit. We found starting point with Backward Euler method and next point with BDF2.

"
Class {
	#name : #PMBDF3Solver,
	#superclass : #PMBDF2Solver,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMBDF3Solver class >> secondStepperClass [
	^ PMBDF2Stepper
]

{ #category : #'as yet unclassified' }
PMBDF3Solver class >> stepperClass [
	^ PMBDF3Stepper
]

{ #category : #'as yet unclassified' }
PMBDF3Solver >> lastStepPrevState: prevState prevPrevState: prevPrevState endTime: endTime [
	"catch partial or full step at end"
	(lastTime equalsTo: endTime )
	ifFalse:
		[state := stepper 
			doStep: state 
				prevState: prevState
				prevPrevState: prevPrevState
				time:  lastTime
			      stepSize: endTime - lastTime.
			self announceState: state time: endTime].			
	^ state
]

{ #category : #'as yet unclassified' }
PMBDF3Solver >> mainStepsPrevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime [
	|previousState previousPrevState |
	previousState := prevState.	
	previousPrevState:=prevPrevState.
	"don't go to end time to avoid overrunning"
	(lastTime to: endTime - self dt  by: self dt) do: 
		[:time | | tempState1 tempState2|
			tempState1 := state.
			tempState2:=previousState.
			state := stepper
				doStep: state 
				prevState: previousState
				prevPrevState: previousPrevState
				time:  time 
				stepSize: self dt.
			previousPrevState:=tempState2.	
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].  
		^ { previousPrevState. previousState }
]

{ #category : #'as yet unclassified' }
PMBDF3Solver >> secondStepPrevState: prevState  startTime: t [

	state := stepper doStep: state prevState: prevState time: t  stepSize: self dt.
	self announceState: state time: t + self dt.
	lastTime := t + self dt.
	^ state
]

{ #category : #'as yet unclassified' }
PMBDF3Solver >> secondStepperClass [
	^ self class secondStepperClass 
]

{ #category : #'as yet unclassified' }
PMBDF3Solver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [
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
				

				"sanity check"
				self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
		
				"take another step if needed"                                                                
				state := self lastStepPrevState: prevState prevPrevState:  prevPrevState endTime: endTime]]].
   		 
	^ state  
]
