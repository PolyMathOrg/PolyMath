Class {
	#name : #PMArrayTest,
	#superclass : #TestCase,
	#category : #'Math-Matrix'
}

{ #category : #tests }
PMArrayTest >> testArray [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 array equals: #( 1 2 3 4 5 6 7 8 ).

	t2 := PMArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self
		assert: t2 array
		equals: #( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )
]

{ #category : #tests }
PMArrayTest >> testCreateScalarTensor [

	| s |
	s := PMArray newWith: 2.
	self assert: (s get: #(  )) equals: 2.
	self should: [ s get: #( 1 1 ) ] raise: Error.
	self assert: s rank equals: 0.
	s set: #(  ) value: 1.
	self assert: (s get: #(  )) equals: 1.
	self assert: s shape equals: #(  ).
	self assert: s size equals: 1
]

{ #category : #tests }
PMArrayTest >> testFirst [

	| a b |
	a := PMArray fromNestedArray: (1 to: 6) asArray.
	self assert: a first equals: #( 1).
	b := a reshape: #( 3 2 ).
	self assert: b first equals: #( 1 1 )
]

{ #category : #tests }
PMArrayTest >> testFlattenedIndexOf [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 flattenedIndexOf: #( 1 2 )) equals: 2.

	t2 := PMArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 flattenedIndexOf: #( 1 2 2 )) equals: 4
]

{ #category : #tests }
PMArrayTest >> testFromNestedArray [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 class equals: PMArray.
	
	t2 := PMArray fromNestedArray: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 class equals: PMArray.
	
]

{ #category : #tests }
PMArrayTest >> testGet [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 get: #( 2 2 )) equals: 6.

	t2 := PMArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 get: #( 3 2 1 )) equals: 11.
	
	self should:[t1 get: #( 4 4 )] raise:Error
]

{ #category : #tests }
PMArrayTest >> testOuterProduct [
|t1 t2|
 t1 := PMArray fromNestedArray: #( #( 1 2 ) 
									 #( 3 1 ) ).
 t2 := PMArray fromNestedArray: #( #( 1 3 ) 
									#( 2 1 ) ).
 self assert: (t1 outerProduct: t2) equals: (PMArray fromNestedArray:#( #( 1 3 2 1 ) 
           																		#( 2 6 4 2 ) 
																					#( 3 9 6 3 ) 
																					#(1 3 2 1))).

t1 := PMArray fromNestedArray: #( #( 1 2)
									#(3 4)
								  #( 1 0 )).
 t2 := PMArray fromNestedArray: #( #( 0 5 2 )
									#( 6 7 3)).
 self assert: (t1 outerProduct: t2) equals: (PMArray fromNestedArray:#(
																		#( 0 5 2 6 7 3) 
																		#( 0 10 4 12 14 6)
																		#( 0 15 6 18 21 9)
																		#( 0 20 8 24 28 12)
																		#( 0 5 2 6 7 3)
																		#( 0 0 0 0 0 0 )
																		 ))
]

{ #category : #tests }
PMArrayTest >> testRank [

	| t1 t2 |
	
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 rank equals: 2.

	t2 := PMArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 rank equals: 3
]

{ #category : #tests }
PMArrayTest >> testReshape [

	| t t1 |
	t := PMArray fromNestedArray: #( #( 0 1 ) #( 2 3 ) #( 4 5 ) ).
	t1 := t reshape: #( 2 3 ).

	self assert: t shape equals: #( 3 2 ).
	self assert: t1 shape equals: #( 2 3 ).
	self assert: t1 array == t array equals: true
]

{ #category : #tests }
PMArrayTest >> testSetValue [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	t1 set: #( 2 2 ) value: 3.
	self assert: (t1 get: #( 2 2 ) ) equals: 3.

	t2 := PMArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) )
							#( #( 5 6 ) #( 7 8 ) )
		         			#( #( 9 10 ) #( 11 12 ) )
							#( #( 13 14 ) #( 15 16 ) ) ).
	t2 set: #( 2 2 1) value: 10.
	self assert: (t2 get: #( 2 2 1 )) equals: 10
]

{ #category : #tests }
PMArrayTest >> testShape [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 shape equals: #( 2 4 ).

	t2 := PMArray fromNestedArray: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 shape equals: #( 4 2 2 )
]

{ #category : #tests }
PMArrayTest >> testSize [

	| t1 t2 |
	t1 := PMArray fromNestedArray: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 size equals: 8.

	t2 := PMArray fromNestedArray: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 size equals: 16
]

{ #category : #tests }
PMArrayTest >> testStrides [

	| a b |
	a := PMArray fromNestedArray: (1 to: 24) asArray.
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
PMArrayTest >> testView [

	| t t1 |
	t := PMArray fromNestedArray:
		     #( #( 10 11 12 ) #( 13 14 15 ) #( 16 17 18 ) #( #( 20 21 22 )
		           #( 23 24 25 ) #( 26 27 28 ) )
		        #( #( 30 31 32 ) #( 33 34 35 ) #( 36 37 38 ) ) ).
	t1 := t view.
	self assert: t array == t1 array equals: true.
	self assert: t shape equals: t1 shape.
	self assert: t shape == t1 shape equals: false.
	self assert: t strides equals: t1 strides.
	self assert: t strides == t1 strides equals: false.
	self assert: t first equals: t1 first.
	self assert: t first == t1 first equals: false.

]
