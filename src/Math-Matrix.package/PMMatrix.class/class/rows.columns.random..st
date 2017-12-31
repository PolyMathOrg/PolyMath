as yet unclassified
rows: rows columns: columns random: aMaxNumber
	"Answer a new Matrix of the given dimensions filled with random numbers"
	|a b|
	a:=	(1 to: rows) collect: [:row |b:=PMVector new:columns .
		1 to: columns do: [:column |
			b  at: column put: (aMaxNumber random)].
		b].
	^PMMatrix rows: a