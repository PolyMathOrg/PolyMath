as yet unclassified
doStep: aState  prevState: prevState prevPrevState:prevPrevState  time: t 
	| x1 x2  |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	x1 :=aState + (self stepSize * (system x: aState t: t )).
	x2 := aState + (self stepSize *(    (  (3 / 8) * (system x: x1 t: t + self stepSize)  ) + (  (19 / 24) * (system x: aState t: t)  ) - (  (5/24)*(system x: prevState t: t - self stepSize)  ) +  (  (1/24)*(  system x: prevPrevState t: t-(2*self stepSize)  )))).
	^ aState + (self stepSize *(    (  (3 / 8) * (system x: x2 t: t + self stepSize)  ) + (  (19 / 24) * (system x: aState t: t )  ) - (  (5/24)*(system x: prevState t: t-self stepSize)  ) +  (  (1/24)*(  system x: prevPrevState t: t-(2*self stepSize))  )))