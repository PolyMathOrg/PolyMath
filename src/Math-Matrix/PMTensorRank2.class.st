Class {
	#name : #PMTensorRank2,
	#superclass : #Object,
	#instVars : [
		'array',
		'shape'
	],
	#category : #'Math-Matrix'
}

{ #category : #arithmetic }
PMTensorRank2 >> * aPMTensor [

	(self checkProductMatrixSize: aPMTensor)
		ifTrue: [ 
			| t |
			t := self class zerosWithShape: { 
					     self numberOfLines.
					     aPMTensor numberOfColumns }.

			1 to: self numberOfLines do: [ :i | 
				1 to: aPMTensor  numberOfColumns do: [ :j | 
					t
						set: { i. j }
						value:
							((1 to: self numberOfColumns) inject: 0 into: [ :sum :k | 
								 (self get: { i. k }) * (aPMTensor get: { k. j }) + sum ]) ] ].
			^ t ]
		ifFalse: [ ShapeMismatch signal ]
]

{ #category : #comparing }
PMTensorRank2 >> = aPMTensorRank2 [

^ (self hasSameShapeAs: aPMTensorRank2) & (self array = aPMTensorRank2 array)
]

{ #category : #accessing }
PMTensorRank2 >> array [
	^ array
]

{ #category : #'as yet unclassified' }
PMTensorRank2 >> array: aFlatArray withShape: aShape [
	array := aFlatArray.
	shape := aShape
]

{ #category : #'as yet unclassified' }
PMTensorRank2 >> checkProductMatrixSize: aPMTensorRank2 [

	^ self numberOfColumns = aPMTensorRank2 numberOfLines
]

{ #category : #'as yet unclassified' }
PMTensorRank2 >> checkReshapeIsPossibleWith: aNewShape [

	^ (shape first * shape second) = ((aNewShape first) * (aNewShape second))
]

{ #category : #public }
PMTensorRank2 >> get: coords [
	| row column |
	row := coords first.
	column := coords second.
	^ array at: (row - 1) * (shape second) + column
]

{ #category : #operation }
PMTensorRank2 >> hadamardProduct: aPMTensorRank2 [
	(self hasSameShapeAs: aPMTensorRank2)
	ifTrue:[
		^ self class new array: ((self array) with: (aPMTensorRank2 array) collect:[:a :b| a*b])
		withShape: self shape.
		]
	ifFalse:[ShapeMismatch signal ]
]

{ #category : #testing }
PMTensorRank2 >> hasSameShapeAs: aTensorRank2 [ 
	^ self shape = aTensorRank2 shape
]

{ #category : #'as yet unclassified' }
PMTensorRank2 >> kroneckerProduct: aPMTensor [

			| t |
			t := self class zerosWithShape: { 
					     ((self numberOfLines) * (aPMTensor numberOfLines)).
					     ((self numberOfColumns) * (aPMTensor numberOfColumns)) }.

			1 to: self numberOfLines  do: [ :i1 | 
				1 to: self numberOfColumns do: [ :j1 |
					1 to: aPMTensor numberOfLines  do: [ :i2 | 
						1 to: aPMTensor numberOfColumns do: [ :j2 |
															t set: { (i1-1)*(aPMTensor numberOfLines)+i2. (j1-1)*(aPMTensor numberOfColumns)+j2 } 
															 value: (self get:{i1. j1})* (aPMTensor get:{ i2.j2 })
															]
														]
													]
												].
											^t
]

{ #category : #accessing }
PMTensorRank2 >> numberOfColumns [
	^ shape second
]

{ #category : #accessing }
PMTensorRank2 >> numberOfLines [
	^ shape first
]

{ #category : #'as yet unclassified' }
PMTensorRank2 >> outerProduct: aPMTensor [

			| t |
			t := self class zerosWithShape: { 
					     ((self numberOfLines) * (aPMTensor numberOfLines)).
					     ((self numberOfColumns) * (aPMTensor numberOfColumns)) }.

			1 to: self numberOfLines  do: [ :i1 | 
				1 to: self numberOfColumns do: [ :j1 |
					1 to: aPMTensor numberOfLines  do: [ :i2 | 
						1 to: aPMTensor numberOfColumns do: [ :j2 |
															t set: { (i1-1)*(aPMTensor numberOfLines)+i2. (j1-1)*(aPMTensor numberOfColumns)+j2 } 
															 value: (self get:{i1. i2}) * (aPMTensor get:{ j1. j2 })
															]
														]
													]
												].
											^t
]

{ #category : #'as yet unclassified' }
PMTensorRank2 >> reshape: aNewShape [

	(self checkReshapeIsPossibleWith: aNewShape)
		ifTrue: [ shape := aNewShape ]
		ifFalse: [ ShapeMismatch signal ]
]

{ #category : #initialization }
PMTensorRank2 >> set: coords value: aValue [

	| row column |
	row := coords first.
	column := coords second.
	array at: row - 1 * shape second + column put: aValue
]

{ #category : #accessing }
PMTensorRank2 >> shape [

	^ shape
]
