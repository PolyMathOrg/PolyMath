linear algebra
testLUPDecomposition
	"Code Example 8.10"

	| s sol1 sol2 |
	s := PMLUPDecomposition equations: #(#(3 2 4) #(2 -5 -1) #(1 -2 2)).
	sol1 := s solve: #(16 6 10).
	sol2 := s solve: #(7 10 9).
	self assert: sol1 size equals: 3.
	self assert: (sol1 at: 1) equals: 2.
	self assert: (sol1 at: 2) equals: -1.
	self assert: (sol1 at: 3) equals: 3.
	self assert: sol2 size equals: 3.
	self assert: (sol2 at: 1) equals: 1.
	self assert: (sol2 at: 2) equals: -2.
	self assert: (sol2 at: 3) equals: 2