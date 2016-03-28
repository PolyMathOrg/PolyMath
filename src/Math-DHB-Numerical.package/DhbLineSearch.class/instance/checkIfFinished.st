as yet unclassified
checkIfFinished
	| g0 dg0 gNew |
	gNew := extendedResult at: 2.
	g0 := boundaryValues at: 1.
	dg0 := boundaryValues at: 2.
	gNew <= (alpha * dg0 + g0)
		ifTrue: [ ^ 0.0 ]
		ifFalse: [ ^ 1.0 ].