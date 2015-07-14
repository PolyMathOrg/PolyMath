initialization
maximumIterations: anInteger
		"Defines the maximum number of iterations.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/1/99 "
	( anInteger isInteger and: [ anInteger > 1])
		ifFalse: [ ^self error: 'Invalid maximum number of iteration: ', anInteger printString].
	maximumIterations := anInteger.