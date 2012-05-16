operation
squared
		"Answers the product of the transpose of the receiver with the receiver (in this order).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^DhbSymmetricMatrix rows: ( self columnsCollect: [ :col | self columnsCollect: [ :colT | col * colT]])