tests
testSkalarMultiplication
	| a r |
	a := DhbMatrix rows: #(#(1 2) #(3 3)).
	"this was intended by the author to be possible; it can be seen by the code and the book:"
	r := a * 2.
	self assert: r class equals: DhbMatrix.
	self assert: r equals: (DhbMatrix rows: #(#(2 4) #(6 6))).
	self assert: 2 * a equals: r.
	a := DhbSymmetricMatrix rows: #(#(1 2) #(2 1)).
	r := a * 2.
	self assert: r equals: (DhbMatrix rows: #(#(2 4) #(4 2))).
	self assert: r class equals: DhbSymmetricMatrix.
	r := 2.0 * a.
	self assert: r equals: (DhbMatrix rows: #(#(2.0 4.0) #(4.0 2.0))).
	self assert: r class equals: DhbSymmetricMatrix