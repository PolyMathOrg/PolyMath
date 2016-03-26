tests
testSwapColumnWithColumn
	| a |
	a := DhbMatrix new initializeRows: #(#(5 40 1) #(3 0 1) #(2 7 1)).
	a swapColumn: 2 withColumn: 1.
	self
		assert: a
		equals: (DhbMatrix new initializeRows: #(#(40 5 1) #(0 3 1) #(7 2 1)))