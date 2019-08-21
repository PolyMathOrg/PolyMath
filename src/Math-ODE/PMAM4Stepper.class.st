"
It is stepper for Adams - Moulton method of order 4.
An s-step Adams - Moulton method can reach order s+1.
We can't use AM4 method until we have two old solution values and  approximate new one. A  AM4 method is implicit. 
"
Class {
	#name : #PMAM4Stepper,
	#superclass : #PMImplicitMultiStepper,
	#category : #'Math-ODE'
}

{ #category : #'as yet unclassified' }
PMAM4Stepper class >> order [
	"AM4 is a fourth order method."
	^ 4
]

{ #category : #stepping }
PMAM4Stepper >> doStep: aState prevState: prevState prevPrevState: prevPrevState time: t [
	| approximateState1 approximateState2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	approximateState1 := aState + (self stepSize * (system state: aState time: t)).
	approximateState2 := aState
		+
			(self stepSize
				*
					(3 / 8 * (system state: approximateState1 time: t + self stepSize) + (19 / 24 * (system state: aState time: t))
						- (5 / 24 * (system state: prevState time: t - self stepSize))
						+ (1 / 24 * (system state: prevPrevState time: t - (2 * self stepSize))))).
	^ aState
		+
			(self stepSize
				*
					(3 / 8 * (system state: approximateState2 time: t + self stepSize) + (19 / 24 * (system state: aState time: t))
						- (5 / 24 * (system state: prevState time: t - self stepSize))
						+ (1 / 24 * (system state: prevPrevState time: t - (2 * self stepSize)))))
]

{ #category : #stepping }
PMAM4Stepper >> doStep: aState prevState: prevState prevPrevState: prevPrevState time: t stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	self stepSize: timeStep.
	^ self
		doStep: aState
		prevState: prevState
		prevPrevState: prevPrevState
		time: t
]

{ #category : #stepping }
PMAM4Stepper >> lastStep: aState prevState: prevState prevPrevState: prevPrevState time: t deltaT: incrementOfTime [
	| approximateState1 approximateState2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	approximateState1 := aState + (self stepSize * (system state: aState time: t)).
	approximateState2 := aState
		+
			(self stepSize
				*
					(3 / 8 * (system state: approximateState1 time: t + incrementOfTime) + (19 / 24 * (system state: aState time: t))
						- (5 / 24 * (system state: prevState time: t - incrementOfTime))
						+ (1 / 24 * (system state: prevPrevState time: t - (2 * incrementOfTime))))).
	^ aState
		+
			(self stepSize
				*
					(3 / 8 * (system state: approximateState2 time: t + incrementOfTime) + (19 / 24 * (system state: aState time: t))
						- (5 / 24 * (system state: prevState time: t - incrementOfTime))
						+ (1 / 24 * (system state: prevPrevState time: t - (2 * incrementOfTime)))))
]

{ #category : #stepping }
PMAM4Stepper >> lastStep: aState prevState: prevState prevPrevState: prevPrevState time: t deltaT: incrementOfTime stepSize: timeStep [
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	self stepSize: timeStep.
	^ self
		lastStep: aState
		prevState: prevState
		prevPrevState: prevPrevState
		time: t
		deltaT: incrementOfTime
]
