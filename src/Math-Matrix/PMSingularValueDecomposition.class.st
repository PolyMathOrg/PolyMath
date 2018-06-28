"
Singular Value Decomposition method.
https://en.wikipedia.org/wiki/Singular_value_decomposition

A = U * S * V transpose

Input: 
 -  A - m x n matrix 

Output: 
 -  U - m x m unitary matrix.
 -  V - n x n unitary matrix.
 -  S - diagonal matrix with singular components on the main diagonal

Example:
[ [ [ 
matrix := PMMatrix rows: #(
	(0 1 0 0)
	(0 0 2 0)
	(0 0 0 3)
	(0 0 0 0)).
	
svd := matrix decompose.
u := svd leftSingularForm.
v := svd rightSingularForm.
s := svd sForm.
 ] ] ]


"
Class {
	#name : #PMSingularValueDecomposition,
	#superclass : #Object,
	#instVars : [
		'm',
		'n',
		'u',
		's',
		'v',
		'signU',
		'signV'
	],
	#category : 'Math-Matrix'
}

{ #category : #'instance creation' }
PMSingularValueDecomposition class >> decompose: aMatrix [
	^ self new initialize: aMatrix
]

{ #category : #initialization }
PMSingularValueDecomposition >> initialize: aMatrix [

	| symU symV eigenU eigenV diag |
	m := aMatrix numberOfRows.
	n := aMatrix numberOfColumns.
	
	symU := aMatrix * aMatrix transpose.
	symV := aMatrix transpose * aMatrix.
	
	"Expensive computation"
	eigenU := symU eigen.
	eigenV := symV eigen.
	
	u := (PMMatrix rows: eigenU vectors) transpose.
	v := (PMMatrix rows: eigenV vectors) transpose.
	
	m < n
		ifTrue: [ diag := eigenU values ]
		ifFalse: [ diag := eigenV values ].
		
	s := PMMatrix rows: m columns: n random: 0.
	s setDiagonal: diag sqrt.
]

{ #category : #accessing }
PMSingularValueDecomposition >> leftSingularForm [

	^ u
]

{ #category : #accessing }
PMSingularValueDecomposition >> rightSingularForm [

	^ v
]

{ #category : #accessing }
PMSingularValueDecomposition >> sForm [

	^ s
]
