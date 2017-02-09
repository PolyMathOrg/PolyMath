linear algebra
testLinearEquationsSingle
	| s sol |
	s := PMLinearEquationSystem
		equations: #(#(1 2 0) #(3 5 4) #(5 6 3))
		constant: #(0.1 12.5 10.3).
	sol := s solution.
	self assert: sol size equals: 3.
	self assert: ((sol at: 1) equalsTo: 0.5).
	self assert: ((sol at: 2) equalsTo: -0.2).
	self assert: ((sol at: 3) equalsTo: 3.0)