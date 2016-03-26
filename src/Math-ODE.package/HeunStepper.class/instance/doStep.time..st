stepping
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	| xi ti  |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	ti := t + self stepSize.
	xi := aState + (self stepSize * (system state: aState time: t)).
	 ^aState + ((self stepSize / 2) * (  (system state: aState time: t) + (system state: xi time: ti) ) ).
	