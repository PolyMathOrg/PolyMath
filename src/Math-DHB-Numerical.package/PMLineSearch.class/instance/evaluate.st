operation
evaluate
	"Overrides the parent method to check if method needs to be executed or
	the full step (x=1) does minimize the function already"
	((boundaryValues at: 3) < (boundaryValues at: 1)
		or: [ (boundaryValues at: 3) <= desiredPrecision ])
			ifTrue: [^ result := 1. ].
	^ super evaluate