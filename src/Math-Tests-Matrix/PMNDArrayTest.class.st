Class {
	#name : #PMNDArrayTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Matrix'
}

{ #category : #tests }
PMNDArrayTest >> testArray [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 asArray  equals: #( 1 2 3 4 5 6 7 8 ).

	t2 := PMNDArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self
		assert: t2 asArray
		equals: #( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )
]

{ #category : #tests }
PMNDArrayTest >> testAt [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 at: #( 2 2 )) equals: 6.

	t2 := PMNDArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 at: #( 3 2 1 )) equals: 11.
	
	self should:[t1 at: #( 4 4 )] raise:Error
]

{ #category : #tests }
PMNDArrayTest >> testAtPut [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	t1 at: #( 2 2 ) put: 3.
	self assert: (t1 at: #( 2 2 ) ) equals: 3.

	t2 := PMNDArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) )
							#( #( 5 6 ) #( 7 8 ) )
		         			#( #( 9 10 ) #( 11 12 ) )
							#( #( 13 14 ) #( 15 16 ) ) ).
	t2 at: #( 2 2 1) put: 10.
	self assert: (t2 at: #( 2 2 1 )) equals: 10
]

{ #category : #tests }
PMNDArrayTest >> testCreateScalarNDArray [

	| s |
	s := PMNDArray fromScalar: 2.
	self assert: (s at: #(  )) equals: 2.
	self should: [ s at: #( 1 1 ) ] raise: Error.
	self assert: s rank equals: 0.
	s at: #(  ) put: 1.
	self assert: (s at: #(  )) equals: 1.
	self assert: s shape equals: #(  ).
	self assert: s size equals: 1
]

{ #category : #tests }
PMNDArrayTest >> testFirst [

	| a b |
	a := PMNDArray fromNestedArray: (1 to: 6) asArray.
	self assert: a first equals: #( 1).
	b := a reshape: #( 3 2 ).
	self assert: b first equals: #( 1 1 )
]

{ #category : #tests }
PMNDArrayTest >> testFlattenedIndexOf [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4  ) #( 5 6 7 8) #( 9 10 11 12)).
	self assert: (t1 flattenedIndexOf: #( 3 2 )) equals: 10.

	t2 := PMNDArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 flattenedIndexOf: #( 1 2 2 )) equals: 4
]

{ #category : #tests }
PMNDArrayTest >> testFromNestedArray [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 class equals: PMNDArray.
	
	t2 := PMNDArray fromNestedArray: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 class equals: PMNDArray.
	
]

{ #category : #tests }
PMNDArrayTest >> testHadamardProduct [
|t1 t2 expectedHadamardProduct|

 t1 := PMNDArray fromNestedArray:  #( 
												#( 1 2 3 4 ) #( 5 6 7 8 ) 
												).
 t2 := PMNDArray fromNestedArray: #( 
												#( 4 3 2 9 ) #( 9 7 6 5 ) 
												).
 expectedHadamardProduct :=  PMNDArray fromNestedArray:#( 
																		#( 4 6 6 36 ) #( 45 42 42 40 )
																		).
												
 self assert: (t1 hadamardProduct: t2) equals: expectedHadamardProduct.

 t1 := PMNDArray fromNestedArray:
				 #( 
					#( #( 1 2 ) #( 3 4 )) 
					#( #( 5 6 ) #( 7 8 ))
					#( #( 9 10) #( 11 12))
					).
					
 t2 := PMNDArray fromNestedArray:
				 #( 
					#( #( 1 3 ) #( 2 1)) 
					#( #( 0 6 ) #( 3 8))
					#( #( 3 5) #( 1 10))
					).
					
 expectedHadamardProduct :=  PMNDArray fromNestedArray:#( 
																			#( #( 1 6 ) #( 6 4 )) 
																			#( #( 0 36 ) #( 21 64 ))
																			#( #( 27 50 ) #( 11 120 ))).


self assert: (t1 hadamardProduct: t2) equals: expectedHadamardProduct
					
				
			
		
	
]

{ #category : #tests }
PMNDArrayTest >> testHadamardProductWithDifferentShapesFails [
|t1 t2|
 t1 := PMNDArray fromNestedArray: #( #( 1 2) #(3 4) #(5 6) #(7 8)).
 t2 := PMNDArray fromNestedArray: #( #( 4 3 2 9 ) #( 9 7 6 5 ) ).
 self should: [t1 hadamardProduct: t2] raise: ShapeMismatch 
]

{ #category : #tests }
PMNDArrayTest >> testRank [

	| t1 t2 |
	
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 rank equals: 2.

	t2 := PMNDArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 rank equals: 3
]

{ #category : #tests }
PMNDArrayTest >> testReshape [

	| t t1 |
	t := PMNDArray fromNestedArray: #( #( 0 1 ) #( 2 3 ) #( 4 5 ) ).
	t1 := t reshape: #( 2 3 ).

	self assert: t shape equals: #( 3 2 ).
	self assert: t1 shape equals: #( 2 3 ).
	self assert: t1 asArray  == t asArray equals: true
]

{ #category : #tests }
PMNDArrayTest >> testShape [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 shape equals: #( 2 4 ).

	t2 := PMNDArray fromNestedArray: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 shape equals: #( 4 2 2 )
]

{ #category : #tests }
PMNDArrayTest >> testSize [

	| t1 t2 |
	t1 := PMNDArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 size equals: 8.

	t2 := PMNDArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 size equals: 16
]

{ #category : #tests }
PMNDArrayTest >> testStrides [

	| a b |
	a := PMNDArray fromNestedArray: (1 to: 24) asArray.
	self assert: a strides equals: #( 1 ).
	b := a reshape: #( 4 6 ).
	self assert: b strides equals: #( 6 1 ).
	b := a reshape: #( 6 4 ).
	self assert: b strides equals: #( 4 1 ).
		self assert: (b flattenedIndexOf: #( 4 2 )) equals: 14.
	b := a reshape: #( 3 4 2 ).
	self assert: b strides equals: #( 8 2 1 ).
	self assert: (b flattenedIndexOf: #( 3 2 1)) equals: 19.
	b := a reshape: #( 2 3 4 ).
	self assert: b strides equals: #( 12 4 1 ).
	self assert: (b flattenedIndexOf: #( 2 2 3 )) equals: 19
]

{ #category : #tests }
PMNDArrayTest >> testView [

	| t t1 |
	t := PMNDArray fromNestedArray:
		     #( #( 10 11 12 ) #( 13 14 15 ) #( 16 17 18 ) #( #( 20 21 22 )
		           #( 23 24 25 ) #( 26 27 28 ) )
		        #( #( 30 31 32 ) #( 33 34 35 ) #( 36 37 38 ) ) ).
	t1 := t view.
	self assert: t asArray == t1 asArray equals: true.
	self assert: t shape equals: t1 shape.
	self assert: t shape == t1 shape equals: false.
	self assert: t strides equals: t1 strides.
	self assert: t strides == t1 strides equals: false.
	self assert: t first equals: t1 first.
	self assert: t first == t1 first equals: false.

]
