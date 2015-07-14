initialization
initialize: anInteger
	"Private"

	degreeOfFreedom := anInteger.
	reducedDOF := (degreeOfFreedom * 2 - 1) sqrt.
	^ self