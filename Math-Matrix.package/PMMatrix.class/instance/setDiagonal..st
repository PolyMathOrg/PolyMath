cell accessing
setDiagonal: aVector

	| n m |
	n := self numberOfRows.
	m := self numberOfColumns.
	n < m
		ifTrue: [
				1 to: n do: [ :i | self rowAt:  i columnAt: i put: (aVector at: i)].
				 ]
		ifFalse: [
				1 to: m do: [ :i | self rowAt:  i columnAt: i put: (aVector at: i)].
				 ].
	^self