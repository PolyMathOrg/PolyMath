stepping
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	| k1 k2 k3 k4 midPoint endPoint |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	midPoint := self stepSize / 2 + t.
	endPoint := self stepSize + t.
	k1 := system x: aState t: t.
	k2 := system x: aState + (k1 * self stepSize / 2) t: midPoint.
	k3 := system x: aState + (k2 * self stepSize / 2) t: midPoint.
	k4 := system x: aState + (k3 * self stepSize) t: endPoint.
	^ aState + ((k1 + k2 + k2 + k3 + k3 + k4) / 6 * self stepSize)