transformation
solve: anArrayOrVector
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 30/3/99 "
	permutation isNil
		ifTrue: [ self protectedDecomposition].
	^permutation = 0
		ifTrue: [ nil]
		ifFalse:[ self backwardSubstitution: ( self forwardSubstitution: anArrayOrVector)]