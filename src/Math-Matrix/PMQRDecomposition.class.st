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

{ #category : #private }
PMQRDecomposition >> decompose [

	| identityMatrix q r householderVector i |
	r := PMMatrix rows: matrixToDecompose rows deepCopy.
	q := PMSymmetricMatrix identity: colSize.
	identityMatrix := q deepCopy.
	1 to: matrixToDecompose numberOfColumns do: [ :col | 
		householderVector := ((r columnAt: col) copyFrom: col to: colSize)
			                     householder.
		i := (PMVector new: col - 1 withAll: 0) , (householderVector at: 2).
		q := q
		     *
		     (identityMatrix
		      - ((householderVector at: 1) * i tensorProduct: i)).
		i := PMMatrix rows:
			     ((r rows allButFirst: col - 1) collect: [ :aRow | 
				      aRow allButFirst: col - 1 ]).
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

{ #category : #'instance creation' }
PMQRDecomposition >> of: matrix [

	matrixToDecompose := matrix.
	colSize := matrixToDecompose numberOfRows.
]
