linear algebra
testLinearEquations
	"Code Example 8.6"

	| s sol1 sol2 |
	s := PMLinearEquationSystem
		equations: #(#(3 2 4) #(2 -5 -1) #(1 -2 2))
		constants: #(#(16 6 10) #(7 10 9)).
	sol1 := s solutionAt: 1.
	sol2 := s solutionAt: 2.
	self assert: sol1 size equals: 3.
	self assert: (sol1 at: 1) equals: 2.
	self assert: (sol1 at: 2) equals: -1.
	self assert: (sol1 at: 3) equals: 3.
	self assert: sol2 size equals: 3.
	self assert: (sol2 at: 1) equals: 1.
	self assert: (sol2 at: 2) equals: -2.
	self assert: (sol2 at: 3) equals: 2