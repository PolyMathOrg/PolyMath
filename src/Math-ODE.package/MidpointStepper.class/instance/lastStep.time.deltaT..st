stepping
lastStep: aState time: t deltaT: incrementOfTime
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	| k1 k2 |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	k1 := system x: aState t: t.
	k2 := system x: (aState + (incrementOfTime*(1/ 2)* k1)) t: t + (incrementOfTime *(1/ 2)).
	^ aState + (k2 * self stepSize).
	