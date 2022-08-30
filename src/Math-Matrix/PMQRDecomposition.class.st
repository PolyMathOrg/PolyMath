"
I am responsible for the decomposition of a matrix, A say, into a product A = QR of an orthogonal matrix Q and an upper triangular matrix R
"
Class {
	#name : #PMQRDecomposition,
	#superclass : #Object,
	#instVars : [
		'matrixToDecompose',
		'colSize'
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

	| identityMatrix q r householderVector i |
	r := self initialRMatrix.
	q := self initialQMatrix.
	identityMatrix := PMSymmetricMatrix identity: colSize.
	1 to: self numberOfColumns do: [ :col | 
		| columnVectorFromRMatrix householderMatrix |
		columnVectorFromRMatrix := r columnVectorAt: col size: colSize.
		householderVector := columnVectorFromRMatrix householder.
		i := (PMVector zeros: col - 1) , (householderVector at: 2).
		householderMatrix := identityMatrix
		                     -
		                     ((householderVector at: 1) * i tensorProduct: i).
		q := q * householderMatrix.
		i := r minor: col - 1 and: col - 1.
		i := i - ((householderVector at: 2) tensorProduct:
			      (householderVector at: 1) * (householderVector at: 2) * i).
		i rows withIndexDo: [ :aRow :index | 
			aRow withIndexDo: [ :n :c | 
				r
					rowAt: col + index - 1
					columnAt: col + c - 1
					put: ((n closeTo: 0)
							 ifTrue: [ 0 ]
							 ifFalse: [ n ]) ] ] ].
	i := 0.
	[ (r rowAt: colSize) allSatisfy: [ :n | n = 0 ] ] whileTrue: [ 
		i := i + 1.
		colSize := colSize - 1 ].
	i > 0 ifTrue: [ 
		r := PMMatrix rows: (r rows copyFrom: 1 to: colSize).
		i := q numberOfColumns - i.
		q := PMMatrix rows:
			     (q rows collect: [ :row | row copyFrom: 1 to: i ]) ].
	^ Array with: q with: r
]

{ #category : #arithmetic }
PMQRDecomposition >> decomposeWithPivot [

	| identMat q r hh i lengthArray rank mx pivot |
	lengthArray := matrixToDecompose columnsCollect: [ :col | col * col ].
	mx := lengthArray indexOf: lengthArray max.
	pivot := Array new: lengthArray size.
	rank := 0.
	r := self initialRMatrix.
	q := self initialQMatrix.
	identMat := PMSymmetricMatrix identity: colSize.
	[ 
	rank := rank + 1.
	pivot at: rank put: mx.
	r swapColumn: rank withColumn: mx.
	lengthArray swap: rank with: mx.
	hh := (r columnVectorAt: rank size: colSize) householder.
	i := (PMVector new: rank - 1 withAll: 0) , (hh at: 2).
	q := q * (identMat - ((hh at: 1) * i tensorProduct: i)).
	i := r minor: rank - 1 and: rank - 1.
	i := i - ((hh at: 2) tensorProduct: (hh at: 1) * (hh at: 2) * i).
	i rows withIndexDo: [ :aRow :index | 
		aRow withIndexDo: [ :n :c | 
			r
				rowAt: rank + index - 1
				columnAt: rank + c - 1
				put: ((n closeTo: 0)
						 ifTrue: [ 0 ]
						 ifFalse: [ n ]) ] ].
	rank + 1 to: lengthArray size do: [ :ind | 
		lengthArray
			at: ind
			put: (lengthArray at: ind) - (r rowAt: rank columnAt: ind) squared ].
	rank < lengthArray size
		ifTrue: [ 
			mx := (lengthArray copyFrom: rank + 1 to: lengthArray size) max.
			(mx closeTo: 0) ifTrue: [ mx := 0 ].
			mx := mx > 0
				      ifTrue: [ lengthArray indexOf: mx startingAt: rank + 1 ]
				      ifFalse: [ 0 ] ]
		ifFalse: [ mx := 0 ].
	mx > 0 ] whileTrue.
	i := 0.
	[ (r rowAt: colSize) allSatisfy: [ :n | n = 0 ] ] whileTrue: [ 
		i := i + 1.
		colSize := colSize - 1 ].
	i > 0 ifTrue: [ 
		r := PMMatrix rows: (r rows copyFrom: 1 to: colSize).
		i := q numberOfColumns - i.
		pivot := pivot copyFrom: 1 to: i.
		q := PMMatrix rows:
			     (q rows collect: [ :row | row copyFrom: 1 to: i ]) ].
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
]
