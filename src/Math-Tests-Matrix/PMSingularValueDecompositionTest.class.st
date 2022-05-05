"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages
- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	ones:		<Object>
	randomMatrix:		<Object>
	s_matrix:		<Object>
	u:		<Object>
	v:		<Object>


    Implementation Points
"
Class {
	#name : #PMSingularValueDecompositionTest,
	#superclass : #TestCase,
	#instVars : [
		'matrix',
		'actualU',
		'actualV',
		'actualS'
	],
	#category : #'Math-Tests-Matrix'
}

{ #category : #'as yet unclassified' }
PMSingularValueDecompositionTest >> loadExample1 [
	"Simple example. Square matrix with real values"
		
	matrix := PMMatrix rows: #(
		(0 4)
		(0 0)).
		
	actualU := PMMatrix rows: #(
		(1 0)
		(0 1)).
		
	actualV := PMMatrix rows: #(
		(0 1)
		(1 0)).
		
	actualS := PMMatrix rows: #(
		(4 0)
		(0 0)).
]

{ #category : #'as yet unclassified' }
PMSingularValueDecompositionTest >> loadExample2 [
	"Simple example. Square matrix with real values"
		
	matrix := PMMatrix rows: #(
		(0 1 0 0)
		(0 0 2 0)
		(0 0 0 3)
		(0 0 0 0)).
		
	actualU := PMMatrix rows: #(
		(0 0 1 0)
		(0 1 0 0)
		(1 0 0 0)
		(0 0 0 1)).
		
	actualV := PMMatrix rows: #(
		(0 0 0 1)
		(0 0 1 0)
		(0 1 0 0)
		(1 0 0 0)).
		
	actualS := PMMatrix rows: #(
		(3 0 0 0)
		(0 2 0 0)
		(0 0 1 0)
		(0 0 0 0)).
]

{ #category : #'as yet unclassified' }
PMSingularValueDecompositionTest >> loadExample3 [
	"Rectangular matrix with real values"
		
	matrix := PMMatrix rows: #(
		(-1 1 0)
		(0 -1 1)).
		
	actualU := PMMatrix rows: (
		Array
			with: (Array with: -1 / (2 sqrt) with: 1 / (2 sqrt))
			with: (Array with: 1 / (2 sqrt) with: 1 / (2 sqrt)) ).
		
	actualV := PMMatrix rows: (
		Array
			with: (Array with: 1 / (6 sqrt) with: -1 / (2 sqrt) with: 1 / (3 sqrt))
			with: (Array with: -2 / (6 sqrt) with: 0 with: 1 / (3 sqrt))
			with: (Array with: 1 / (6 sqrt) with: 1 / (2 sqrt) with: 1 / (3 sqrt)) ).
		
	actualS := PMMatrix rows: (
		Array
			with: (Array with: 3 sqrt with: 0 with: 0)
			with: (Array with: 0 with: 1 with: 0) ).
]

{ #category : #'as yet unclassified' }
PMSingularValueDecompositionTest >> loadExample4 [
	"Rectangular matrix with real values"
		
	matrix := PMMatrix rows: #(
		(1 0 0 0 2)
		(0 0 3 0 0)
		(0 0 0 0 0)
		(0 2 0 0 0)).
		
	actualU := PMMatrix rows: #(
		(0 0 1 0)
		(0 1 0 0)
		(0 0 0 -1)
		(1 0 0 0)).
		
	actualV := PMMatrix rows: (Array
		with: ( Array with: 0 with: 0 with: 0.2 sqrt with: 0 with: -1 * (0.8 sqrt))
		with: ( Array with: 1 with: 0 with: 0 with: 0 with: 0)
		with: ( Array with: 0 with: 1 with: 0 with: 0 with: 0)
		with: ( Array with: 0 with: 0 with: 0 with: 1 with: 0)
		with: ( Array with: 0 with: 0 with: 0.8 sqrt with: 0 with: 0.2 sqrt)
	).
		
	actualS := PMMatrix rows: (Array
		with: (Array with: 2 with: 0 with: 0 with: 0 with: 0)
		with: (Array with: 0 with: 3 with: 0 with: 0 with: 0)
		with: (Array with: 0 with: 0 with: 5 sqrt with: 0 with: 0)
		with: (Array with: 0 with: 0 with: 0 with: 0 with: 0)
	)
]

{ #category : #initialization }
PMSingularValueDecompositionTest >> setUp [
	super setUp.
	self loadExample1
	"self loadExample2."
	"self loadExample3."
	"self loadExample4."
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsExampleCorrect [
	"Verifying that the example SVD is correct"

	| reconstructed |
	reconstructed := actualU * actualS * actualV transpose.
	self assert: reconstructed closeTo: matrix.
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsExampleOrthonormalU [
	"Verifying that matrix U in the given example is orthonormal. That is, all columns of U are unit vectors and orthogonal to each other."
	
	| m identity |
		
	m := actualU numberOfRows.
	
	identity := PMSymmetricMatrix identity: m.
	self assert: (actualU transpose * actualU) closeTo: identity
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsExampleOrthonormalV [
	"Verifying that matrix V in the given example is orthonormal. That is, all columns of V are unit vectors and orthogonal to each other."
	
	| n identity |
		
	n := actualV numberOfRows.
	
	identity := PMSymmetricMatrix identity: n.
	self assert: (actualV transpose * actualV) closeTo: identity
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsOrthonormalU [

	"Verifying that matrix U is orthonormal. That is, all columns of U are unit vectors and orthogonal to each other."

	| u m identity |
	u := matrix decomposeSV leftSingularMatrix.
	m := u numberOfRows.
	identity := PMSymmetricMatrix identity: m.
	self assert: u transpose * u closeTo: identity
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsOrthonormalV [

	"Verifying that matrix U is orthonormal. That is, all columns of U are unit vectors and orthogonal to each other."

	| v n identity |
	v := matrix decomposeSV rightSingularMatrix.
	n := v numberOfRows.
	identity := PMSymmetricMatrix identity: n.
	self assert: v transpose * v closeTo: identity
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsSquareU [

	"U should be a square matrix"

	| u |
	u := matrix decomposeSV leftSingularMatrix.
	self assert: u numberOfRows equals: u numberOfColumns
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testIsSquareV [

	"V should be a square matrix"

	| v |
	v := matrix decomposeSV rightSingularMatrix.
	self assert: v numberOfRows equals: v numberOfColumns
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testReconstruction [

	| svd u v s reconstructed |
	svd := matrix decomposeSV.
	u := svd leftSingularMatrix.
	v := svd rightSingularMatrix.
	s := svd diagonalSingularValueMatrix.
	reconstructed := u * s * v transpose.
	self assert: reconstructed closeTo: matrix
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testShapeS [

	"If A is an (m x n) matrix, then S should be an (m x n) matrix"

	| s m n |
	s := matrix decomposeSV diagonalSingularValueMatrix.
	m := matrix numberOfRows.
	n := matrix numberOfColumns.
	self assert: s numberOfRows equals: m.
	self assert: s numberOfColumns equals: n
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testShapeU [

	"If A is an (m x n) matrix, then U should be an (m x m) matrix"

	| u m |
	u := matrix decomposeSV leftSingularMatrix.
	m := matrix numberOfRows.
	self assert: u numberOfRows equals: m.
	self assert: u numberOfColumns equals: m
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testShapeV [

	"If A is an (m x n) matrix, then V should be an (n x n) matrix"

	| v n |
	v := matrix decomposeSV rightSingularMatrix.
	n := matrix numberOfColumns.
	self assert: v numberOfRows equals: n.
	self assert: v numberOfColumns equals: n
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testValueS [

	"Comparing S to its known value"

	| s |
	s := matrix decomposeSV diagonalSingularValueMatrix.
	self assert: s closeTo: actualS
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testValueU [

	"Comparing U to its known value"

	| u |
	u := matrix decomposeSV leftSingularMatrix.
	self assert: u closeTo: actualU
]

{ #category : #tests }
PMSingularValueDecompositionTest >> testValueV [

	"Comparing V to its known value"

	| v |
	v := matrix decomposeSV rightSingularMatrix.
	self assert: v closeTo: actualV
]
