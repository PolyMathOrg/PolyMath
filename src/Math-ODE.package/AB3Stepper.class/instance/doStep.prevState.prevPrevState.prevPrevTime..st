stepping
doStep: thisState prevState:prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	 ^ self stepSize * (  ( (23/12) * (system state: thisState time:  prevPrevTime+ (2* self stepSize) )) - ((4/3)*(system state: prevState time: prevPrevTime+ self stepSize)) + ((5/12)*(system state: prevPrevState time: prevPrevTime ) )) + thisState.
