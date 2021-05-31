"
This class can be instantiated like PMMatrix via #rows:, but the user has to make sure that this matrix is indeed symmetric as this is not internally checked for speed reasons.
"
Class {
	#name : #PMSymmetricMatrix,
	#superclass : #PMMatrix,
	#category : #'Math-Matrix'
}

{ #category : #'instance creation' }
PMSymmetricMatrix class >> identity: anInteger [
		"Create an identity matrix of dimension anInteger"
	^self new initializeIdentity: anInteger
]

{ #category : #'instance creation' }
PMSymmetricMatrix class >> join: anArrayOfMatrices [
		"Inverse of the split operation"
	| rows n |
	rows := OrderedCollection new.
	n := 0.
	( anArrayOfMatrices at: 1) rowsDo:
		[ :each |
		  n := n + 1.
		  rows add: each, ( ( anArrayOfMatrices at: 3) columnAt: n).
		].
	n := 0.
	( anArrayOfMatrices at: 2) rowsDo:
		[ :each |
		  n := n + 1.
		  rows add: ( ( anArrayOfMatrices at: 3) rowAt: n), each.
		].
	^self rows: rows
]

{ #category : #information }
PMSymmetricMatrix class >> lupCRLCriticalDimension [
	^36
]

{ #category : #'instance creation' }
PMSymmetricMatrix class >> new: dim function: aBlock [
"Answer a new symmetric matrix with dimensions dim filled with 
aBlock value: RowposRespectivelyColpos value: ColposRespectivelyRowpos"
	|a aRow|
	a:=self new basicInitialize: dim.
	aRow := PMVector new: dim.
	1 to: dim do:[:i|aRow at: i put: (aBlock value: i value:1)].
	a rows at: 1 put: aRow.
	2 to: dim do: [:rowPos|
		aRow :=PMVector new: dim .
		1 to: rowPos -1 do:[:pos| aRow at: pos put: ((a rows at: pos) at: rowPos)].
		rowPos to: dim do:[:pos| aRow at: pos put: (aBlock value: rowPos value:pos)]. 
		(a rows) at: rowPos put: aRow ].    
	^a 
]

{ #category : #'as yet unclassified' }
PMSymmetricMatrix class >> new: dim random: aMaxNumber [
	"Answer a new symmetric matrix of the given dimensions filled with random numbers"
	|a aRow|
	a:=self new:dim .
	1 to: dim do:[:i|a rowAt: 1 columnAt: i put: (aMaxNumber random)].
	2 to: dim do: [:rowPos|
		aRow :=PMVector new: dim .
		1 to: rowPos -1 do:[:pos| aRow at: pos put: (a rowAt: pos columnAt: rowPos)  ] .
		rowPos to: dim do:[:pos| aRow at: pos put: (aMaxNumber random) ]. 
		(a rows) at: rowPos put: aRow ]  .    
	^a 
]

{ #category : #'as yet unclassified' }
PMSymmetricMatrix class >> rows: rows columns: columns random: aMaxNumber [
	^ self shouldNotImplement
]

{ #category : #operation }
PMSymmetricMatrix >> + aMatrix [
	"Answers the sum of the receiver with aMatrix."
	^ aMatrix addWithSymmetricMatrix: self
]

{ #category : #operation }
PMSymmetricMatrix >> - aMatrix [
	"Answers the difference between the receiver and aMatrix"
	^ aMatrix subtractWithSymmetricMatrix: self
]

{ #category : #'double dispatching' }
PMSymmetricMatrix >> addWithSymmetricMatrix: aMatrix [
	^self class 
		new: aMatrix numberOfRows 
		function: [ :x :y|((rows at:x)at:y)+((aMatrix rows at:x)at:y) ]

]

{ #category : #transformation }
PMSymmetricMatrix >> asSymmetricMatrix [
	"simple speed up"

	^ self
]

{ #category : #information }
PMSymmetricMatrix >> atColumn: aColumnIndex put: aCollection [
	self shouldNotImplement 
]

{ #category : #information }
PMSymmetricMatrix >> atRow: aRowIndex put: aCollection [
	self shouldNotImplement 
]

{ #category : #initialization }
PMSymmetricMatrix >> basicInitialize: anInteger [
	"private"
	rows := PMVector new: anInteger.
]

{ #category : #initialization }
PMSymmetricMatrix >> clear [
	
	rows do: [ :each | each atAllPut: 0].
]

{ #category : #information }
PMSymmetricMatrix >> columnAt: anInteger [
	^ rows at: anInteger   
]

{ #category : #iterators }
PMSymmetricMatrix >> columnsCollect: aBlock [
	^ rows collect: aBlock 
]

{ #category : #iterators }
PMSymmetricMatrix >> columnsDo: aBlock [
	^ rows do: aBlock 
]

{ #category : #operation }
PMSymmetricMatrix >> crlInverse [
	"corrected sequence of calcs; s1in matrices at:2 has to be calced first (split returns matrices in this order: b, d, c).
and taken care of degenerate cases (which is unnecessary, if this method is not called outside of inverse)"
	| matrices b1 cb1ct cb1 |
	rows size = 1
		ifTrue: [ ^self inverse1By1].
	rows size = 2
		ifTrue: [ ^self inverse2By2].
	matrices := self split.
	b1 := (matrices at: 1) inverse.
	cb1 := (matrices at: 3) * b1.
	cb1ct := (cb1 productWithTransposeMatrix: (matrices at: 3))asSymmetricMatrix .
	matrices at: 2 put: ((matrices at: 2) - cb1ct ) inverse.
	matrices at: 3 put: (matrices at: 2) * cb1.
	matrices at: 1 put: ( b1 + (cb1 transposeProductWithMatrix: (matrices at: 3))asSymmetricMatrix).
	(matrices at: 3) negate.
	^ self class join: matrices
]

{ #category : #operation }
PMSymmetricMatrix >> eigen [
	"Computes all eigenvalues and eigenvectors for symmetric matrix using Jacobi transformation
	Usage:
	matrix eigen values.
	matrix eigen vectors."

	^ PMJacobiTransformationHelper matrix: self.
]

{ #category : #initialization }
PMSymmetricMatrix >> initializeIdentity: anInteger [
	"Build components for an identity matrix."
	rows := ( 1 to: anInteger) asPMVector collect: [ :n | (PMVector new: anInteger) atAllPut: 0; at: n put: 1; yourself].
]

{ #category : #operation }
PMSymmetricMatrix >> inverse [
	"Answer the inverse of the receiver"

	^(rows size < self class lupCRLCriticalDimension or: [lupDecomposition notNil]) 
			ifTrue: [ self lupInverse ]
			ifFalse: [ self crlInverse ]
]

{ #category : #operation }
PMSymmetricMatrix >> inverse1By1 [
	"Private - Answer the inverse of the receiver when it is a 1x1 matrix (no check is made)."
	^ self class rows: ( PMVector with: ( PMVector with: ( 1/ ((rows at: 1) at: 1))))
]

{ #category : #operation }
PMSymmetricMatrix >> inverse2By2 [
	"Private - Answer the inverse of the receiver when it is a 2x2 matrix (no check is made)."
	| line1 line2 |
	line1 := PMVector with: ((rows at: 2) at: 2) with: ((rows at: 1) at: 2) negated.
	line2 := PMVector with: ((rows at: 1) at: 2) negated with: ((rows at: 1) at: 1).
	^self class rows: ( PMVector with: line1 with: line2) * (1 / (((rows at: 1) at: 1) * ((rows at: 2) at: 2) - ((rows at: 1) at: 2) squared))
]

{ #category : #operation }
PMSymmetricMatrix >> inversePureCRL [
	"Answer the inverse of the receiver."
	| matrices b1 cb1 cb1ct |
	[rows size = 1
		ifTrue: [ ^self inverse1By1]]on: ZeroDivide do: [:e| PMSingularMatrixError new signal].
	rows size = 2
		ifTrue: [ ^ self inverse2By2].
	matrices := self split.
	b1 := (matrices at: 1) inversePureCRL.
	cb1 := (matrices at: 3) * b1.
	cb1ct := (cb1 productWithTransposeMatrix: ( matrices at: 3)) asSymmetricMatrix.
	matrices at: 2 put: ((matrices at: 2) - cb1ct) inversePureCRL.
	matrices at: 3 put: (matrices at: 2) * cb1.
	matrices at: 1 put: (b1 + ( cb1 transposeProductWithMatrix: ( matrices at: 3))asSymmetricMatrix).
	(matrices at: 3) negate.
	^ self class join: matrices
]

{ #category : #operation }
PMSymmetricMatrix >> inversePureLUP [
	"Answer the inverse of the receiver."

	lupDecomposition := nil.
	self lupDecomposition inverseMatrixComponents
		ifNil: [ PMSingularMatrixError new signal ]
		ifNotNil: [ :i | ^ self class rows: i ]
]

{ #category : #testing }
PMSymmetricMatrix >> isHermitian [
	"Every real symmetric matrix is Hermitian"
	^ self isReal
]

{ #category : #testing }
PMSymmetricMatrix >> isSquare [
	"Answers true because a symmetric matrix is square."
	^true
]

{ #category : #testing }
PMSymmetricMatrix >> isSymmetric [
		"Answers true because the receiver is a symmetric matrix"
	^true
]

{ #category : #information }
PMSymmetricMatrix >> numberOfColumns [
	"Answer the number of columns of the receiver."
	^rows size
]

{ #category : #'private ' }
PMSymmetricMatrix >> privateTranspose [ 
	^ self 
]

{ #category : #transformation }
PMSymmetricMatrix >> split [
	"Private - 
	Answers an array of 3 matrices split from the receiver"

	| n |
	n := self largestPowerOf2SmallerThan: rows size.
	^Array
		with: (self class rows: ((1 to: n) asPMVector collect: [:k | (rows at: k)
						copyFrom: 1 to: n]))
		with: (self class rows: ((n + 1 to: rows size) asPMVector collect: [:k | (rows at: k)
						copyFrom: n + 1 to: rows size]))
		with: (self class superclass rows: ((n + 1 to: rows size) asPMVector collect: [:k | (rows at: k)
						copyFrom: 1 to: n]))
]

{ #category : #'double dispatching' }
PMSymmetricMatrix >> subtractWithSymmetricMatrix: aMatrix [
	^ self class 
		new: aMatrix numberOfRows 
		function: [ :x :y|((aMatrix rows at:x)at:y)-(( rows at:x)at:y) ]
]

{ #category : #information }
PMSymmetricMatrix >> transpose [
	"Answer a new matrix, transpose of the receiver. optimized"
	^self deepCopy
]
