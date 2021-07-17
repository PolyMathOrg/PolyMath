Class {
	#name : #PMTensorRank2Test,
	#superclass : #TestCase,
	#instVars : [
		'array'
	],
	#category : #'Math-Matrix'
}

{ #category : #tests }
PMTensorRank2Test >> testHadamardProduct [
|t1 t2|
 t1 := PMTensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
 t2 := PMTensorRank2 rows: #( #( 4 3 2 9 ) #( 9 7 6 5 ) ).
 self assert: (t1 hadamardProduct: t2) equals: (PMTensorRank2 rows:#( #( 4 6 6 36 ) #( 45 42 42 40 ) ))
]

{ #category : #tests }
PMTensorRank2Test >> testHadamardProductWithDifferentShapes [
|t1 t2|
 t1 := PMTensorRank2 rows: #( #( 1 2) #(3 4) #(5 6) #(7 8)).
 t2 := PMTensorRank2 rows: #( #( 4 3 2 9 ) #( 9 7 6 5 ) ).
 self should: [t1 hadamardProduct: t2] raise: ShapeMismatch 
]

{ #category : #tests }
PMTensorRank2Test >> testKroneckerProduct [
|t1 t2|
 t1 := PMTensorRank2 rows: #( #( 1 2 )
									#( 3 1 )).
 t2 := PMTensorRank2 rows: #( #( 1 3 )
									#( 2 1 )).
 self assert: (t1 kroneckerProduct: t2) equals: (PMTensorRank2 rows:#(
																		#( 1 3 2 6 ) 
																		#( 2 1 4 2 )
																		#( 3 9 1 3 )
																		#( 6 3 2 1 ) )).
 t1 := PMTensorRank2 rows: #( #( 1 2)
									#(3 4)
								  #( 1 0 )).
 t2 := PMTensorRank2 rows: #( #( 0 5 2 )
									#( 6 7 3)).
 self assert: (t1 kroneckerProduct: t2) equals: (PMTensorRank2 rows:#(
																		#( 0 5 2 0 10 4) 
																		#( 6 7 3 12 14 6)
																		#( 0 15 6 0 20 8)
																		#( 18 21 9 24 28 12)
																		#( 0 5 2 0 0 0)
																		#( 6 7 3 0 0 0 )
																		 ))
]

{ #category : #tests }
PMTensorRank2Test >> testOrdinaryProduct [
|t1 t2|
 t1 := PMTensorRank2 rows: #( #( 1 2 )
									#( 3 4 )).
 t2 := PMTensorRank2 rows: #( #( 4 3 )
									#( 2 5 )).
 self assert: (t1 * t2) equals: (PMTensorRank2 rows:#( #( 8 13 ) #( 20 29 ) ))
]

{ #category : #tests }
PMTensorRank2Test >> testOrdinaryProductWithTheNumberOFLineOfFirstTensorIsEqualsOfNumberOfColumnToSecondTensor [

	| t1 t2 |
	t1 := PMTensorRank2 rows: #( #( 1 2 ) #( 3 4 ) #( 5 6 ) ).
	t2 := PMTensorRank2 rows: #( #( 4 3 2 ) #( 9 7 6 ) #(10 11 12)).
	self should: [ t1 * t2 ] raise: ShapeMismatch
]

{ #category : #tests }
PMTensorRank2Test >> testOuterProduct [
|t1 t2|
 t1 := PMTensorRank2 rows: #( #( 1 2 ) 
									 #( 3 1 ) ).
 t2 := PMTensorRank2 rows: #( #( 1 3 ) 
									#( 2 1 ) ).
 self assert: (t1 outerProduct: t2) equals: (PMTensorRank2 rows:#( #( 1 3 2 1 ) 
           																		#( 2 6 4 2 ) 
																					#( 3 9 6 3 ) 
																					#(1 3 2 1))).

t1 := PMTensorRank2 rows: #( #( 1 2)
									#(3 4)
								  #( 1 0 )).
 t2 := PMTensorRank2 rows: #( #( 0 5 2 )
									#( 6 7 3)).
 self assert: (t1 outerProduct: t2) equals: (PMTensorRank2 rows:#(
																		#( 0 5 2 6 7 3) 
																		#( 0 10 4 12 14 6)
																		#( 0 15 6 18 21 9)
																		#( 0 20 8 24 28 12)
																		#( 0 5 2 6 7 3)
																		#( 0 0 0 0 0 0 )
																		 ))
]

{ #category : #tests }
PMTensorRank2Test >> testReShape [

	| t |
	t := PMTensorRank2 rows: #(#(0 1) #(2 3) #(4 5)).
	self assert: (t reshape: #(2 3)) equals: (PMTensorRank2 rows:#(#(0 1 2) #(3 4 5)))
]

{ #category : #tests }
PMTensorRank2Test >> testReShapeNotPossible [

	| t |
	t := PMTensorRank2 rows: #( #( 0 1 ) #( 2 3 ) #( 4 5 ) ).
	self
		should: [t reshape: #( 5 3 )]
		raise: ShapeMismatch 
]

{ #category : #tests }
PMTensorRank2Test >> testRows [

	| t1 t2|
	t1 := PMTensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 get: #(1 1)) equals: 1.
	self assert: (t1 get: #(2 1)) equals: 5.
	self assert: (t1 get: #(2 4)) equals: 8.
	t2 := PMTensorRank2 rows: #( #( 1 2) #(3 4) #( 5 6) #(7 8 )).
	self assert: (t2 get: #(1 1)) equals: 1.
	self assert: (t2 get: #(2 1)) equals: 3.
	self assert: (t2 get: #(4 2)) equals: 8.
	
	

]

{ #category : #tests }
PMTensorRank2Test >> testShape [

	| t |
	t := PMTensorRank2 rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t shape equals: #( 2 4 )
]

{ #category : #tests }
PMTensorRank2Test >> testZerosWithShape [

	| t |
	t := PMTensorRank2 zerosWithShape: #( 10 10 ).
	1 to: t numberOfColumns do: [ :i | 
		1 to: t numberOfLines do: [ :j | 
			self
				assert: (t get: { 
							 i.
							 j })
				equals: 0 ] ]
]
