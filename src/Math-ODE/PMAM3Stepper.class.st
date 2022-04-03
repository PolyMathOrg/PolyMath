"
It is stepper for Adams - Moulton method of order 3.
An s-step Adams - Moulton method can reach order s+1.
We can't use AM3 method until we have old solution value and approximate new one. A  AM3 method is implicit.
"
Class {
	#name : #PMAM3Stepper,
	#superclass : #PMImplicitMultiStepper,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAM3Stepper class >> order [
	"AM3 is a third order method."
	^ 3
]

{ #category : #stepping }
PMAM3Stepper >> doStep: aState prevState: prevState time: t [

	| approximateState1 approximateState2 |
	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	approximateState1 := aState
	                     +
	                     (self stepSize
	                      *
	                      (system state: aState time: t + self stepSize)).
	approximateState2 := aState + (self stepSize * (5 / 12
	                       *
	                       (system
		                        state: approximateState1
		                        time: t + (2 * self stepSize))
	                       +
	                       (2 / 3
	                        *
	                        (system state: aState time: t + self stepSize))
	                       - (1 / 12 * (system state: prevState time: t)))).
	^ aState + (self stepSize * (5 / 12
	    * (system state: approximateState2 time: t + (2 * self stepSize))
	    + (2 / 3 * (system state: aState time: t + self stepSize))
	    - (1 / 12 * (system state: prevState time: t))))
]

{ #category : #stepping }
PMAM3Stepper >> doStep: aState prevState: prevState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	self stepSize: timeStep.
	^ self doStep: aState prevState: prevState time: t
]

{ #category : #stepping }
PMAM3Stepper >> lastStep: aState prevState: prevState time: t deltaT: incrementOfTime [

	| approximateState1 approximateState2 |
	self stepSize ifNil: [ self error: 'step size required by stepper' ].
	approximateState1 := aState
	                     +
	                     (self stepSize
	                      *
	                      (system state: aState time: t + incrementOfTime)).
	approximateState2 := aState + (self stepSize * (5 / 12
	                       *
	                       (system
		                        state: approximateState1
		                        time: t + (2 * incrementOfTime))
	                       +
	                       (2 / 3
	                        *
	                        (system
		                         state: aState
		                         time: t + incrementOfTime))
	                       - (1 / 12 * (system state: prevState time: t)))).
	^ aState + (self stepSize * (5 / 12
	    *
	    (system state: approximateState2 time: t + (2 * incrementOfTime))
	    + (2 / 3 * (system state: aState time: t + incrementOfTime))
	    - (1 / 12 * (system state: prevState time: t))))
]

{ #category : #stepping }
PMAM3Stepper >> lastStep: aState prevState: prevState time: t deltaT: incrementOfTime stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	self stepSize: timeStep.
	^ self
		lastStep: aState
		prevState: prevState
		time: t - timeStep
		deltaT: incrementOfTime
]
