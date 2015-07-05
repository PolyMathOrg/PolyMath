accessing
lupDecomposition

	lupDecomposition isNil
		ifTrue: [ lupDecomposition :=DhbLUPDecomposition equations: rows ].
	^ lupDecomposition