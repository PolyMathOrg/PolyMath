as yet unclassified
doStep: aState  prevState: prevState time: t
	| x1 x2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	x1 :=aState + (self stepSize * (system x: aState t: t + self stepSize)).
	x2 := aState + (self stepSize *((  (5 / 12) * (system x: x1 t: t + (2*self stepSize))  ) + (  (2/3)*(system x: aState t: t + self stepSize)  ) -  (  (1/12)*(  system x: prevState t: t)  ))).
	^ aState + (self stepSize *((  (5 / 12) * (system x: x2 t: t + (2*self stepSize))  ) + (  (2/3)*(system x: aState t: t + self stepSize)  ) -  (  (1/12)*(  system x: prevState t: t)  )))