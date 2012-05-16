operation
strassenProductWithMatrix: aMatrix
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/5/99 "
	| matrixSplit selfSplit p1 p2 p3 p4 p5 p6 p7 |
	( self numberOfRows > 2 and: [ self numberOfColumns > 2])
		ifFalse:[ ^self class rows: ( aMatrix rowsCollect: [ :row | self columnsCollect: [ :col | row * col]])].
	selfSplit := self split.
	matrixSplit := aMatrix split.
	p1 := ( ( selfSplit at: 2) - ( selfSplit at: 4)) strassenProductWithMatrix: ( matrixSplit at: 1).
	p2 := ( selfSplit at: 4) strassenProductWithMatrix: ( ( matrixSplit at: 1) + ( matrixSplit at: 2)).
	p3 := ( selfSplit at: 1) strassenProductWithMatrix: ( ( matrixSplit at: 3) + ( matrixSplit at: 4)).
	p4 := ( ( selfSplit at: 3) - ( selfSplit at: 1)) strassenProductWithMatrix: ( matrixSplit at: 4).
	p5 := ( ( selfSplit at: 1) + ( selfSplit at: 4)) strassenProductWithMatrix: ( ( matrixSplit at: 1) + ( matrixSplit at: 4)).
	p6 := ( ( selfSplit at: 3) + ( selfSplit at: 4)) strassenProductWithMatrix: ( ( matrixSplit at: 2) - ( matrixSplit at: 4)).
	p7 := ( ( selfSplit at: 1) + ( selfSplit at: 2)) strassenProductWithMatrix: ( ( matrixSplit at: 1) - ( matrixSplit at: 3)).
	^self class join: ( Array
							with: ( p5 + p4 + p6 - p2)
							with: (p1 + p2)
							with: ( p3 + p4)
							with: ( p5 + p1 - p3 - p7)
							)