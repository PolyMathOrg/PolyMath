as yet unclassified
lastStep: aState prevState: prevState prevPrevState: prevPrevState time: t deltaT: incrementOfTime
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