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
PMQRDecomposition >> columnVectorFrom: r startingAt: col [

	^ r columnVectorAt: col size: colSize .
]

{ #category : #private }
PMQRDecomposition >> decompose [

	| identityMatrix q r householderVector i |
	r := self initialRMatrix.
	q := self initialQMatrix.
	identityMatrix := PMSymmetricMatrix identity: colSize.
	1 to: self numberOfColumns do: [ :col | 
		| columnVectorFromRMatrix |
		columnVectorFromRMatrix := self columnVectorFrom: r startingAt: col.
		householderVector := columnVectorFromRMatrix householder.
		i := (PMVector zeros: col - 1) , (householderVector at: 2).
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