tests
testMPInverse
	| a |
	a:=(DhbMatrix new initializeRows: #(#(5 40 1) #(0 0 1) #(0 0 1) ) ).
	self mpTestFunction: a.
	a :=a *  (DhbMatrix rows: 3 columns: 3 random:  5.0)  .
	self mpTestFunction: a.
	a :=DhbMatrix new initializeRows: #(#(5 40 1 2.5) #(0 0 1 2.5) #(0 0 1 2.5) ) .
	self mpTestFunction: a.
	a:=	a transpose .
	self mpTestFunction: a.
	3 timesRepeat: [
		a :=DhbMatrix rows: 3 columns: 3 random: 1.0 .
		self assert: (a mpInverse equalsTo: a inverse  )  .
		a :=DhbSymmetricMatrix new: 4 random: 1.0 .
		self assert: (a mpInverse equalsTo: a inverse  )  ]