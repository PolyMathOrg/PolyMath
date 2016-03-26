as yet unclassified
doStep: aState prevState: prevState time: t
	| approximateState1 approximateState2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	approximateState1 := aState + (self stepSize * (system state: aState time: t + self stepSize)).
	approximateState2 := aState
		+
			(self stepSize
				*
					(5 / 12 * (system state: approximateState1 time: t + (2 * self stepSize)) + (2 / 3 * (system state: aState time: t + self stepSize))
						- (1 / 12 * (system state: prevState time: t)))).
	^ aState
		+
			(self stepSize
				*
					(5 / 12 * (system state: approximateState2 time: t + (2 * self stepSize)) + (2 / 3 * (system state: aState time: t + self stepSize))
						- (1 / 12 * (system state: prevState time: t))))