initialization
centerOn: aVector 
	"(c) Copyrights Didier BESSET, 2000, all rights reserved. 
	Initial code: 2/16/00"

	accumulator := aVector isNil
				ifTrue: [nil]
				ifFalse: [DhbMahalanobisCenter onVector: aVector]