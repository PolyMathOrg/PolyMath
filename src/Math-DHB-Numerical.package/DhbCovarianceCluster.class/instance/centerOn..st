initialization
centerOn: aVector 

	accumulator := aVector isNil
				ifTrue: [nil]
				ifFalse: [DhbMahalanobisCenter onVector: aVector]