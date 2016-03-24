initialization
centerOn: aVector 

	accumulator := aVector isNil
				ifTrue: [nil]
				ifFalse: [ PMMahalanobisCenter onVector: aVector ]