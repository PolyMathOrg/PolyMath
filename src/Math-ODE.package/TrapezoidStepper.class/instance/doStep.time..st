stepping
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "
	| xi1 xi2 ti |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].	
	ti := t + self stepSize.
	xi1 := aState + (self stepSize * (system state: aState time: t)).
	xi2 := aState + ((1 / 2) * self stepSize * ((system state: aState time: t) + (system state: xi1 time: ti))).
	^ aState + ((1 / 2) * self stepSize * ((system state: aState time: t) + (system state: xi2 time: ti)))