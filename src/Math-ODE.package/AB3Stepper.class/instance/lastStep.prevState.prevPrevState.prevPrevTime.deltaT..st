as yet unclassified
lastStep: thisState prevState: prevState prevPrevState: prevPrevState prevPrevTime: prevPrevTime deltaT: incrementOfTime
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].	
				
	 ^ self stepSize * (  ( (23/12) * (system x: thisState t:  prevPrevTime+ (2* incrementOfTime) )) - ((4/3)*(system x: prevState t: prevPrevTime+ incrementOfTime)) + ((5/12)*(system x: prevPrevState t: prevPrevTime ) )) + thisState.
