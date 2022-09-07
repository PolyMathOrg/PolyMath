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

	| identityMatrix householderVector i matrixOfMinor |
	identityMatrix := PMSymmetricMatrix identity: colSize.
	1 to: self numberOfColumns do: [ :col | 
		| columnVectorFromRMatrix householderMatrix v |
		columnVectorFromRMatrix := r columnVectorAt: col size: colSize.
		householderVector := columnVectorFromRMatrix householder.
		v := (PMVector zeros: col - 1) , (householderVector at: 2).
		householderMatrix := identityMatrix
		                     -
		                     ((householderVector at: 1) * v tensorProduct: v).
		q := q * householderMatrix.
		matrixOfMinor := r minor: col - 1 and: col - 1.
		matrixOfMinor := matrixOfMinor
		                 - ((householderVector at: 2) tensorProduct:
				                  (householderVector at: 1)
				                  * (householderVector at: 2) * matrixOfMinor).
		matrixOfMinor rowsWithIndexDo: [ :aRow :index | 
			aRow withIndexDo: [ :element :c | 
				r
					rowAt: col + index - 1
					columnAt: col + c - 1
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

	| identityMatrix householderVector i v vectorOfNormSquareds rank mx pivot matrixOfMinor |
	vectorOfNormSquareds := matrixToDecompose columnsCollect: [ 
		                        :columnVector | columnVector * columnVector ].
	mx := vectorOfNormSquareds indexOf: vectorOfNormSquareds max.
	pivot := Array new: vectorOfNormSquareds size.
	rank := 0.
	identityMatrix := PMSymmetricMatrix identity: colSize.
	[ 
	| householderMatrix |
	rank := rank + 1.
	pivot at: rank put: mx.
	r swapColumn: rank withColumn: mx.
	vectorOfNormSquareds swap: rank with: mx.
	householderVector := (r columnVectorAt: rank size: colSize)
		                     householder.
	v := (PMVector zeros: rank - 1) , (householderVector at: 2).
	householderMatrix := identityMatrix
	                     -
	                     ((householderVector at: 1) * v tensorProduct: v).
	q := q * householderMatrix.
	matrixOfMinor := r minor: rank - 1 and: rank - 1.
	matrixOfMinor := matrixOfMinor
	                 - ((householderVector at: 2) tensorProduct:
			                  (householderVector at: 1)
			                  * (householderVector at: 2) * matrixOfMinor).
	matrixOfMinor rowsWithIndexDo: [ :aRow :index | 
		aRow withIndexDo: [ :element :column | 
			r
				rowAt: rank + index - 1
				columnAt: rank + column - 1
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
			mx := (vectorOfNormSquareds
				       copyFrom: rank + 1
				       to: vectorOfNormSquareds size) max.
			(mx closeTo: 0) ifTrue: [ mx := 0 ].
			mx := mx > 0
				      ifTrue: [ 
				      vectorOfNormSquareds indexOf: mx startingAt: rank + 1 ]
				      ifFalse: [ 0 ] ]
		ifFalse: [ mx := 0 ].
	mx > 0 ] whileTrue.
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
