"
LUP stands for Lower, Upper and Permutation. It comes from the observation that any non-singular square matrix A can be decomposed into a product of 3 square matrices of the same dimension.

LUP decomposition is another technique to solve a
system of linear equations. It is an alternative to the Gaussian elimination. Gaussian elimination can solve a system with several constant vectors, but all constant vectors must be known before starting the algorithm.

LUP decomposition is done once for the matrix of a given system. Thus, the system can be solved for any constant vector obtained after the LUP decomposition. In addition, LUP decomposition gives a way to calculate the determinant of a matrix and it can be used to compute the inverse of a matrix.

Instance variables
- rows contains a copy of the rows of the matrix representing the system of linear equations, i.e.the matrix A; copying the matrix is necessary since LUP decomposition destroys the components; at the end of the LUP decomposition, it will contain the components of the matrices L and U,
- permutation contains an array of integers describing the permutation, i.e.the matrix P,
- parity contains parity of the permutation for efficiency purpose.

[[[
| s sol1 sol2 |
s := PMLUPDecomposition equations: #( (3 2 4) (2 -5 -1) (1 -2 2)).
sol1 := s solve: #(16 6 10).
sol2 := s solve: #(7 10 9).
]]]
"
Class {
	#name : #PMLUPDecomposition,
	#superclass : #Object,
	#instVars : [
		'rows',
		'permutation',
		'parity'
	],
	#category : #'Math-Matrix'
}

{ #category : #creation }
PMLUPDecomposition class >> direct: anArrayOfArrays [
	
	^ self basicNew initialize: anArrayOfArrays.
]

{ #category : #creation }
PMLUPDecomposition class >> equations: anArrayOfArrays [
	^ self new initialize: (anArrayOfArrays collect: [ :each | each copy ])
]

{ #category : #private }
PMLUPDecomposition >> backwardSubstitution: anArray [
	"Private"
	| n sum answer |
	n := rows size.
	answer := PMVector new: n.
	n to: 1 by: -1 do:
		[ :i |
		  sum := anArray at: i.
		  ( i + 1) to: n do: [ :j | sum := sum - ( ( ( rows at: i) at: j) * ( answer at: j))].
		  answer at: i put: sum / ( ( rows at: i) at: i).
		].
	^answer
]

{ #category : #private }
PMLUPDecomposition >> decompose [
	"Private"
	| n |
	n := rows size.
	permutation := (1 to: n) asArray.
	1 to: ( n - 1) do:
		[ :k |
		  self swapRow: k withRow: ( self largestPivotFrom: k);
			   pivotAt: k.
		].
]

{ #category : #operations }
PMLUPDecomposition >> determinant [
	| n |
	permutation isNil
		ifTrue: [ self protectedDecomposition ].
	permutation = 0
		ifTrue: [ ^ 0 ].	"Singular matrix has 0 determinant"
	n := 0.
	^ rows inject: parity
		  into: [ :det :each | n := n + 1. ( each at: n) * det ]
]

{ #category : #private }
PMLUPDecomposition >> forwardSubstitution: anArray [
	"Private"
	| n sum answer|
	answer := permutation collect: [ :each | anArray at: each].
	n := rows size.
	2 to: n do:
		[ :i |
		  sum := answer at: i.
		  1 to: (i - 1) do: [ :j | sum := sum - (((rows at: i) at: j) * (answer at: j))].
		  answer at: i put: sum.
		].
	^answer
]

{ #category : #initialization }
PMLUPDecomposition >> initialize: anArrayOfArrays [
	rows := anArrayOfArrays.
	parity := 1.
	^ self
]

{ #category : #operations }
PMLUPDecomposition >> inverseMatrixComponents [
	| n inverseRows column |
	permutation isNil
		ifTrue: [ self protectedDecomposition].
	permutation = 0
		ifTrue: [ ^ nil].	"Singular matrix has no inverse"
	n := rows size.
	inverseRows := (1 to: n) asPMVector collect: [ :j | PMVector new: n].
	1 to: n do:
		[ :j |
		  column := self solve: ( ( Array new: rows size) atAllPut: 0; at: j put: 1; yourself).
		  column ifNil: [^nil].	"Singular matrix has no inverse"
		  1 to: n do: [ :i | ( inverseRows at: i) at: j put: ( column at: i)].
		]. 
	^inverseRows
]

{ #category : #operations }
PMLUPDecomposition >> largestPivotFrom: anInteger [
	"Private - Answers the largest pivot element in column anInteger, from position anInteger upward."
	| valueOfMaximum indexOfMaximum value |
	valueOfMaximum := ((rows at: anInteger) at: anInteger) abs.
	indexOfMaximum := anInteger.
	(anInteger + 1) to: rows size do:
		[ :n |
		  value := ((rows at: n) at: anInteger) abs.
		  value > valueOfMaximum
				ifTrue: [ valueOfMaximum := value.
						  indexOfMaximum := n ].
		].
	^ indexOfMaximum
]

{ #category : #private }
PMLUPDecomposition >> pivotAt: anInteger [
	"Private"
	| inversePivot size k |
	inversePivot := 1 / ((rows at: anInteger) at: anInteger).
	size := rows size.
	k := anInteger + 1.
	k to: size
		do: [ :i |
			  (rows at: i) at: anInteger put: ((rows at: i) at: anInteger) * inversePivot.
			  k to: size
				do: [ :j |
					  (rows at: i) at: j put: ((rows at: i) at: j) - (((rows at: i) at: anInteger) * ((rows at: anInteger) at: j)).
					]
			].
]

{ #category : #printing }
PMLUPDecomposition >> printOn: aStream [
	
	| delimitingString |
	rows do:
		[ :row |
		  delimitingString := '('.
		  row do:
			[ :each |
				aStream nextPutAll: delimitingString.
				each printOn: aStream.
				delimitingString := ' ' ].
		  aStream nextPut: $).
		]
		separatedBy: [ aStream cr ]
]

{ #category : #private }
PMLUPDecomposition >> protectedDecomposition [
	"Private - If decomposition fails, set permutation to 0."
	[ self decompose] on: Error do: [ :signal | permutation := 0. signal return: nil].
]

{ #category : #private }
PMLUPDecomposition >> solve: anArrayOrVector [
	permutation isNil
		ifTrue: [ self protectedDecomposition ].
	^ permutation = 0
		ifTrue: [ nil ]
		ifFalse:[ 
			[self backwardSubstitution: ( self forwardSubstitution: anArrayOrVector)] on: ZeroDivide do: [:e|  nil] ]
]

{ #category : #private }
PMLUPDecomposition >> swapRow: anInteger1 withRow: anInteger2 [
	"Private - Swap the rows indexed by the given integers."
	| swappedRow |
	anInteger1 = anInteger2 ifTrue: [ ^ self ].
	swappedRow := rows at: anInteger1.
	rows at: anInteger1 put: (rows at: anInteger2).
	rows at: anInteger2 put: swappedRow.
	swappedRow := permutation at: anInteger1.
	permutation at: anInteger1 put: (permutation at: anInteger2).
	permutation at: anInteger2 put: swappedRow.
	parity := parity negated
]
