stepping
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it."

	| k1 k2 k3 k4 midPoint endPoint |
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	midPoint := self stepSize / 2 + t.
	endPoint := self stepSize + t.
	k1 := system state: aState time: t.
	k2 := system state: aState + (k1 * self stepSize / 2) time: midPoint.
	k3 := system state: aState + (k2 * self stepSize / 2) time: midPoint.
	k4 := system state: aState + (k3 * self stepSize) time: endPoint.
	^ aState + ((k1 + k2 + k2 + k3 + k3 + k4) / 6 * self stepSize)