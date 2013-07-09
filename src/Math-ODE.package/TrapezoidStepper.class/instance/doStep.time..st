as yet unclassified
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	self stepSize isNil ifTrue: [self error: 'step size required by stepper'].
	aState isNumber 
		ifTrue: [^ (self stepSize * (system x: aState t: t) + aState)]
	"a collection"	
		ifFalse:
			[(1 to: aState size) 
			do: [ :i |
				| xi1 xi2 x0 ti |
					ti := t + self stepSize.
					x0 := aState at: i. 
					xi1 := x0 + self stepSize* (system x: x0 t: t). "predict"
					xi2 := x0 +  (1/2)*self stepSize*( (system x: x0 t: t) +  (system x: xi1 t: ti)  ). "correction 1"
					aState at: i put: x0 + (1/2)*self stepSize*( (system x: x0 t: t) +  (system x: xi2 t: ti)  ) ]. "correction 2"
				^ aState.]