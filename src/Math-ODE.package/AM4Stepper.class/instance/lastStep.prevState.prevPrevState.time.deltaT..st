as yet unclassified
lastStep: aState  prevState: prevState prevPrevState:prevPrevState  time: t deltaT: incrementOfTime
	| x1 x2  |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	x1 :=aState + (self stepSize * (system x: aState t: t )).
	x2 := aState + (self stepSize *(    (  (3 / 8) * (system x: x1 t: t +  incrementOfTime)  ) + (  (19 / 24) * (system x: aState t: t)  ) - (  (5/24)*(system x: prevState t: t -  incrementOfTime)  ) +  (  (1/24)*(  system x: prevPrevState t: t-(2* incrementOfTime)  )))).
	^ aState + (self stepSize *(    (  (3 / 8) * (system x: x2 t: t +  incrementOfTime)  ) + (  (19 / 24) * (system x: aState t: t )  ) - (  (5/24)*(system x: prevState t: t- incrementOfTime)  ) +  (  (1/24)*(  system x: prevPrevState t: t-(2* incrementOfTime))  )))