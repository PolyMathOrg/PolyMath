operation
initializeIterations
	"If no initial value has been defined, take 0 as the starting point (for lack of anything better).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "

	functionBlock isNil ifTrue: [self error: 'No function supplied'].
	self computeInitialValues