operation
contract
	"Private - Contract the Simplex around the best Vector.
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/16/00 "

	| bestVector oldVectors |
	bestVector := bestPoints first position.
	oldVectors := OrderedCollection with: worstVector.
	[bestPoints size > 1] whileTrue: [oldVectors add: bestPoints removeLast position].
	oldVectors do: [:each | self contract: each around: bestVector].
	worstVector := bestPoints removeLast position.
	^self computePrecision