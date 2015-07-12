transformation
countOverflows: anInteger

	anInteger > 0
		ifTrue: [ overflow := overflow + 1 ]
		ifFalse: [ underflow := underflow + 1 ]