operation
tensorProduct: aVector
		"Answers the tensor product of the receiver with aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	self dimension = aVector dimension
		ifFalse:[ ^self error: 'Vector dimensions mismatch to build tensor product'].
	^DhbSymmetricMatrix rows: ( self collect: [ :a | aVector collect: [ :b | a * b]])