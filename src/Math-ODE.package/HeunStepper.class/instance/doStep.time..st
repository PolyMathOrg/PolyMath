as yet unclassified
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. "

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	aState isNumber
		ifTrue: [ ^ self numberStep: aState time: t ]
		"a collection"
		ifFalse: [ 
			(1 to: aState size) do: [ :i | aState at: i put: [ ^ self numberStep: (aState at: i) time: t ] ].
			^ aState ]	