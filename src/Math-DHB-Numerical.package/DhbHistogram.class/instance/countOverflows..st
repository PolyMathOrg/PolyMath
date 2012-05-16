transformation
countOverflows: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	anInteger > 0
		ifTrue: [ overflow := overflow + 1]
		ifFalse:[ underflow := underflow + 1].