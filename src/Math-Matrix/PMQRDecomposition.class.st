"
I am responsible for the decomposition of a matrix, A say, into a product A = QR of an orthogonal matrix Q and an upper triangular matrix R
"
Class {
	#name : #PMQRDecomposition,
	#superclass : #Object,
	#instVars : [
		'matrixToDecompose',
		'colSize',
		'r',
		'q'
	],
	#category : #'Math-Matrix'
}

{ #category : #'instance creation' }
PMQRDecomposition class >> of: matrix [
	matrix numberOfRows < matrix numberOfColumns ifTrue: [ 
		self error: 'numberOfRows<numberOfColumns' ].
	^ self new of: matrix
]

{ #category : #arithmetic }
PMQRDecomposition >> decompose [

	"
The method appears to be using Householder reflection. There is a wiki page
that describes the mechanics:
https://en.wikipedia.org/wiki/QR_decomposition#Using_Householder_reflections
"

	| i matrixOfMinor |
	1 to: self numberOfColumns do: [ :col | 
		| householderReflection householderMatrix householderVector columnVectorFromRMatrix |
		columnVectorFromRMatrix := r columnVectorAt: col size: colSize.
		householderReflection := self
			                         householderReflectionOf:
			                         columnVectorFromRMatrix
			                         atColumnNumber: col.
		householderVector := householderReflection at: 1.
		householderMatrix := householderReflection at: 2.
		q := q * householderMatrix.
		matrixOfMinor := r minor: col - 1 and: col - 1.
		matrixOfMinor := matrixOfMinor
		                 - ((householderVector at: 2) tensorProduct:
				                  (householderVector at: 1)
				                  * (householderVector at: 2) * matrixOfMinor).
		matrixOfMinor rowsWithIndexDo: [ :aRow :index | 
			aRow withIndexDo: [ :element :column | 
				| rowNumber columnNumber |
				rowNumber := col + index - 1.
				columnNumber := col + column - 1.
				r
					rowAt: rowNumber
					columnAt: columnNumber
					put: ((element closeTo: 0)
							 ifTrue: [ 0 ]
							 ifFalse: [ element ]) ] ] ].
	i := 0.
	[ (r rowAt: colSize) isZero ] whileTrue: [ 
		i := i + 1.
		colSize := colSize - 1 ].
	i > 0 ifTrue: [ 
		r := self upperTriangularPartOf: r With: colSize.
		i := q numberOfColumns - i.
		q := PMMatrix rows:
			     (q rowsCollect: [ :row | row copyFrom: 1 to: i ]) ].
	^ Array with: q with: r
]

{ #category : #arithmetic }
PMQRDecomposition >> decomposeWithPivot [

	| i vectorOfNormSquareds rank positionOfMaximum pivot matrixOfMinor |
	vectorOfNormSquareds := matrixToDecompose columnsCollect: [ 
		                        :columnVector | columnVector * columnVector ].
	positionOfMaximum := vectorOfNormSquareds indexOf: vectorOfNormSquareds max.
	pivot := Array new: vectorOfNormSquareds size.
	rank := 0.
	[ 
	| householderReflection householderMatrix householderVector columnVectorFromRMatrix |
	rank := rank + 1.
	pivot at: rank put: positionOfMaximum.
	r swapColumn: rank withColumn: positionOfMaximum.
	vectorOfNormSquareds swap: rank with: positionOfMaximum.
	columnVectorFromRMatrix := r columnVectorAt: rank size: colSize.
	householderReflection := self
		                         householderReflectionOf:
		                         columnVectorFromRMatrix
		                         atColumnNumber: rank.
	householderVector := householderReflection at: 1.
	householderMatrix := householderReflection at: 2.
	q := q * householderMatrix.
	matrixOfMinor := r minor: rank - 1 and: rank - 1.
	matrixOfMinor := matrixOfMinor
	                 - ((householderVector at: 2) tensorProduct:
			                  (householderVector at: 1)
			                  * (householderVector at: 2) * matrixOfMinor).
	matrixOfMinor rowsWithIndexDo: [ :aRow :index | 
		aRow withIndexDo: [ :element :column | 
			| rowNumber columnNumber |
			rowNumber := rank + index - 1.
			columnNumber := rank + column - 1.
			r
				rowAt: rowNumber
				columnAt: columnNumber
				put: ((element closeTo: 0)
						 ifTrue: [ 0 ]
						 ifFalse: [ element ]) ] ].
	rank + 1 to: vectorOfNormSquareds size do: [ :ind | 
		vectorOfNormSquareds
			at: ind
			put:
			(vectorOfNormSquareds at: ind)
			- (r rowAt: rank columnAt: ind) squared ].
	rank < vectorOfNormSquareds size
		ifTrue: [ 
			positionOfMaximum := (vectorOfNormSquareds
				       copyFrom: rank + 1
				       to: vectorOfNormSquareds size) max.
			(positionOfMaximum closeTo: 0) ifTrue: [ positionOfMaximum := 0 ].
			positionOfMaximum := positionOfMaximum > 0
				      ifTrue: [ 
				      vectorOfNormSquareds indexOf: positionOfMaximum startingAt: rank + 1 ]
				      ifFalse: [ 0 ] ]
		ifFalse: [ positionOfMaximum := 0 ].
	positionOfMaximum > 0 ] whileTrue.
	i := 0.
	[ (r rowAt: colSize) isZero ] whileTrue: [ 
		i := i + 1.
		colSize := colSize - 1 ].
	i > 0 ifTrue: [ 
		r := self upperTriangularPartOf: r With: colSize.
		i := q numberOfColumns - i.
		pivot := pivot copyFrom: 1 to: i.
		q := PMMatrix rows:
			     (q rowsCollect: [ :row | row copyFrom: 1 to: i ]) ].
	^ Array with: q with: r with: pivot
]

{ #category : #private }
PMQRDecomposition >> householderReflectionOf: columnVector atColumnNumber: columnNumber [

	| householderVector v identityMatrix householderMatrix |
	householderVector := columnVector householder.
	v := (PMVector zeros: columnNumber - 1) , (householderVector at: 2).
	identityMatrix := PMSymmetricMatrix identity: colSize.
	householderMatrix := identityMatrix
	                     -
	                     ((householderVector at: 1) * v tensorProduct: v).
	^ Array with: householderVector with: householderMatrix .
]

{ #category : #private }
PMQRDecomposition >> initialQMatrix [

	^ PMSymmetricMatrix identity: colSize
]

{ #category : #private }
PMQRDecomposition >> initialRMatrix [

	^ PMMatrix rows: matrixToDecompose rows deepCopy
]

{ #category : #private }
PMQRDecomposition >> numberOfColumns [

	^ matrixToDecompose numberOfColumns
]

{ #category : #'instance creation' }
PMQRDecomposition >> of: matrix [

	matrixToDecompose := matrix.
	colSize := matrixToDecompose numberOfRows.
		r := self initialRMatrix.
	q := self initialQMatrix.
]

{ #category : #private }
PMQRDecomposition >> upperTriangularPartOf: matrix With: columnSize [

	^ PMMatrix rows: (r rows copyFrom: 1 to: columnSize)
]
