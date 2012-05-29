stepping
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."
	self stepSize isNil ifTrue: [self error: 'step size required by stepper'].
	aState isNumber 
		ifTrue: 
			[^ (self numberDoStep: aState time: t)]
	"a collection"	
		ifFalse:
			[^ (self collectionDoStep: aState time: t)]