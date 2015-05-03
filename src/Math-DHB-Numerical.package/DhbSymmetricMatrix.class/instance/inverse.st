operation
inverse
	"Answer the inverse of the receiver"

	^(rows size < self class lupCRLCriticalDimension or: [lupDecomposition notNil]) 
			ifTrue: [self lupInverse]
			ifFalse: [self crlInverse]