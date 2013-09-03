as yet unclassified
doStep: aState prevState: prevState prevPrevState: prevPrevState time: t
	| approximateState1 approximateState2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	approximateState1 := aState + (self stepSize * (system x: aState t: t)).
	approximateState2 := aState
		+
			(self stepSize
				*
					(3 / 8 * (system x: approximateState1 t: t + self stepSize) + (19 / 24 * (system x: aState t: t))
						- (5 / 24 * (system x: prevState t: t - self stepSize))
						+ (1 / 24 * (system x: prevPrevState t: t - (2 * self stepSize))))).
	^ aState
		+
			(self stepSize
				*
					(3 / 8 * (system x: approximateState2 t: t + self stepSize) + (19 / 24 * (system x: aState t: t))
						- (5 / 24 * (system x: prevState t: t - self stepSize))
						+ (1 / 24 * (system x: prevPrevState t: t - (2 * self stepSize)))))