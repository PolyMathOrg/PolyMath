operation
initializeIterations
	"If no initial value has been defined, take 0 as the starting point (for lack of anything better)."

	functionBlock isNil ifTrue: [self error: 'No function supplied'].
	self computeInitialValues