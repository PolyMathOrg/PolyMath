information
intercept
		"Answers the intercept of the receiver."
	intercept isNil
		ifTrue: [ self computeResults].
	^intercept