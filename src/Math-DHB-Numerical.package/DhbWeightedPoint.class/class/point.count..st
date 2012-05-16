creation
point: aNumber count: anInteger
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/5/00 "
	^self point: aNumber @ anInteger
		weight: ( anInteger > 0 ifTrue: [ 1 / anInteger]
								ifFalse:[ 1])