operation
evaluate
	(boundaryValues at: 3) < (boundaryValues at: 1)
		ifTrue: [
			^ result := 1. ].
	^ super evaluate