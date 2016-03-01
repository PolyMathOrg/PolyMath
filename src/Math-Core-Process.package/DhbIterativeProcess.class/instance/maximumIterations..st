initialization
maximumIterations: anInteger
	"Defines the maximum number of iterations."
	( anInteger isInteger and: [ anInteger > 1])
		ifFalse: [ ^self error: 'Invalid maximum number of iteration: ', anInteger printString].
	maximumIterations := anInteger.