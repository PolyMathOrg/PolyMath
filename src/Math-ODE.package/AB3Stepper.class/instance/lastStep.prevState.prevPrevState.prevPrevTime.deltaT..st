as yet unclassified
lastStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime deltaT: incrementOfTime
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].	
				
	 ^ self stepSize * (  ( (23/12) * (system state: thisState time:  prevPrevTime+ (2* incrementOfTime) )) - ((4/3)*(system state: prevState time: prevPrevTime+ incrementOfTime)) + ((5/12)*(system state: prevPrevState time: prevPrevTime ) )) + thisState.
