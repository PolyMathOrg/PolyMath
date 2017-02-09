linear algebra
testLinearEquationsSingular
	| s sol |
	s := PMLinearEquationSystem
		equations: #(#(1 2 0) #(10 12 6) #(5 6 3))
		constant: #(0.1 12.5 10.3).
	sol := s solution.
	self assert: sol isNil