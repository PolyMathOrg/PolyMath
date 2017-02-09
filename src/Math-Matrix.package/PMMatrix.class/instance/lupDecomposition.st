accessing
lupDecomposition

	lupDecomposition isNil
		ifTrue: [ lupDecomposition :=PMLUPDecomposition equations: rows ].
	^ lupDecomposition