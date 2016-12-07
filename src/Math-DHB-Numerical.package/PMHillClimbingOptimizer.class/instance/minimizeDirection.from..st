operation
minimizeDirection: aVectorFunction from: aVector 
	"Private"

	^aVectorFunction
		origin: aVector;
		argumentWith: ( self minimizeDirection: aVectorFunction)