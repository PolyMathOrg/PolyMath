"
I am responsible for the decomposition of a matrix, A say, into a product A = QR of an orthogonal matrix Q and an upper triangular matrix R
"
Class {
	#name : #PMQRDecomposition,
	#superclass : #Object,
	#category : #'Math-Matrix'
}

{ #category : #'instance creation' }
PMQRDecomposition >> decompose: aMatrix [

	| identityMatrix q r hh colSize i |
	aMatrix numberOfRows < aMatrix numberOfColumns ifTrue: [ 
		self error: 'numberOfRows<numberOfColumns' ].
	r := PMMatrix rows: aMatrix rows deepCopy.
	colSize := aMatrix numberOfRows.
	q := PMSymmetricMatrix identity: colSize.
	identityMatrix := q deepCopy.
	1 to: aMatrix numberOfColumns do: [ :col | 
		hh := ((r columnAt: col) copyFrom: col to: colSize) householder.
		i := (PMVector new: col - 1 withAll: 0) , (hh at: 2).
		q := q * (identityMatrix - ((hh at: 1) * i tensorProduct: i)). "not really necessary, should be simplified"
		i := PMMatrix rows:
			     ((r rows allButFirst: col - 1) collect: [ :aRow | 
				      aRow allButFirst: col - 1 ]).
		i := i - ((hh at: 2) tensorProduct: (hh at: 1) * (hh at: 2) * i).
		i rows withIndexDo: [ :aRow :index | 
			aRow withIndexDo: [ :n :c | 
				r
					rowAt: col + index - 1
					columnAt: col + c - 1
					put: ((n closeTo: 0)
							 ifTrue: [ 0 ]
							 ifFalse: [ n ]) ] ]
		"col <colSize ifTrue: [i :=(hh at: 2) copyFrom: 2 to: colSize -col +1.  i withIndexDo: [:n :index| r rowAt: col columnAt: index put: n  ]  ]""and this part is not correct, dont uncomment before the bug is corrected! useful if q is not explicitely necessary" ].
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
