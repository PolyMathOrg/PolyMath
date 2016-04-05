information
slope
		"Answers the slope of the receiver."
	slope isNil
		ifTrue: [ self computeResults].
	^slope