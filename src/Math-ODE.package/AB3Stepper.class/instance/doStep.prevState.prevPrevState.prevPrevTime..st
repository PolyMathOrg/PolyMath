as yet unclassified
doStep: thisState prevState:prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (23/12) * (system x: thisState t:  prevPrevTime+ (2* self stepSize) )) - ((4/3)*(system x: prevState t: prevPrevTime+ self stepSize)) + ((5/12)*(system x: prevPrevState t: prevPrevTime ) )) + thisState.
