information
determinant
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 6/5/99 "
	| n |
	permutation isNil
		ifTrue: [ self protectedDecomposition].
	permutation = 0
		ifTrue: [ ^0].	"Singular matrix has 0 determinant"
	n := 0.
	^rows inject: parity
		  into: [ :det :each | n := n + 1. ( each at: n) * det]