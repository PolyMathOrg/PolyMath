transformation
growContents: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	anInteger > 0
		ifTrue: [ self growPositiveContents: anInteger]
		ifFalse:[ self growNegativeContents: anInteger].