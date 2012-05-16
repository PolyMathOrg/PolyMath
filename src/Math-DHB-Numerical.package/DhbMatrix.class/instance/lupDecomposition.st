information
lupDecomposition
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	lupDecomposition isNil
		ifTrue: [ lupDecomposition :=DhbLUPDecomposition equations: rows].
	^lupDecomposition