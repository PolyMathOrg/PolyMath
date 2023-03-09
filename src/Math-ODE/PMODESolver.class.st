"
An ODE Solver uses a Stepper to solve a System. 

The main interface once the solver is set up (it has a stepper and a solver) is
	solve: system x0: aState t0: startTime t1: endTime
	solve: system x0: aState t0: startTime t1: endTime stepSize: dt
	
Announcements are made when a step is taken.
"
Class {
	#name : #PMODESolver,
	#superclass : #Object,
	#instVars : [
		'stepper',
		'system',
		'dt',
		'announcer',
		'lastTime',
		'state'
	],
	#category : #'Math-ODE'
}

{ #category : #'class variables' }
PMODESolver class >> stepperClass [
	^ShouldBeImplemented.
]

{ #category : #solving }
PMODESolver >> announceState: aState time: aTime [
	self announcer announce: (self announcementClass state: aState time: aTime)
]

{ #category : #'announcement hooks' }
PMODESolver >> announcementClass [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PMODESolver >> announcer [
	^ announcer
]

{ #category : #accessing }
PMODESolver >> announcer: anAnnouncer [
	announcer  := anAnnouncer 
]

{ #category : #'announcement hooks' }
PMODESolver >> announcerClass [

	^ self subclassResponsibility
]

{ #category : #accessing }
PMODESolver >> dt [
	^ dt
]

{ #category : #accessing }
PMODESolver >> dt: aFloat [ 
	dt := aFloat
]

{ #category : #initialize }
PMODESolver >> initialize [
	
	super initialize.
	announcer := self announcerClass new.
]

{ #category : #solving }
PMODESolver >> lastStepState: aState endTime: endTime [
	"catch partial or full step at end"
	(lastTime closeTo: endTime )
		ifFalse:
			[state := stepper 
				lastStep: state 
				time: lastTime 
				stepSize: endTime - lastTime
				deltaT: dt.
				self announceState: state time: endTime].			
	^ state
]

{ #category : #solving }
PMODESolver >> mainStepsState: aState startTime: initialTime endTime: endTime [
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
]

{ #category : #solving }
PMODESolver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime [

	self system: aSystem.
	stepper ifNil: [
		self stepper: ((self stepperClass) onSystem: self system)].
	state := initialState.
      lastTime:=initialTime.

	"announce initial conditions"
	self announceState: state time: initialTime.
	
	(lastTime+dt > endTime and: lastTime < endTime)
	ifTrue:[
		state :=self lastStepState: state endTime: endTime].
	
	lastTime+dt<= endTime 
	ifTrue:[	
	"step until the end"
	state := self mainStepsState: state startTime: initialTime endTime: endTime.
	
	"sanity check"
	self assert: [(lastTime between: initialTime and: endTime) 
				or: [lastTime between: endTime and: initialTime]].
	
	"take another step if needed"
	state := self lastStepState: state endTime: endTime.].

	^ state
]

{ #category : #solving }
PMODESolver >> solve: aSystem startState: initialState startTime: initialTime endTime: endTime stepSize: timeStep [
	self dt: timeStep.
	^ self solve: aSystem  startState:  initialState  startTime:  initialTime endTime: endTime.
]

{ #category : #accessing }
PMODESolver >> stepper: aStepper [

	stepper := aStepper.
	system isNotNil ifTrue: [ stepper system: system ]
]

{ #category : #private }
PMODESolver >> stepperClass [
	^ self class stepperClass
]

{ #category : #accessing }
PMODESolver >> system [

	^ system
]

{ #category : #accessing }
PMODESolver >> system: aSystem [

	system := aSystem.
	stepper isNotNil ifTrue: [ stepper system: aSystem ]
]
