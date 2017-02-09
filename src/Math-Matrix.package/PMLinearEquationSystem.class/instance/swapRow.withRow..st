transformation
swapRow: anInteger1 withRow: anInteger2
	"Private - Swap the rows indexed by the given integers."

	| swappedRow |
	anInteger1 = anInteger2
		ifTrue: [ ^ self ].
	swappedRow := rows at: anInteger1.
	rows at: anInteger1 put: (rows at: anInteger2).
	rows at: anInteger2 put: swappedRow