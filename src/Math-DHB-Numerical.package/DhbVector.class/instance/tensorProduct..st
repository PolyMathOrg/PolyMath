operation
tensorProduct: aVector
		"Answers the tensor product of the receiver with aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^DhbMatrix rows: ( self collect: [ :a | aVector collect: [ :b | a * b]])
