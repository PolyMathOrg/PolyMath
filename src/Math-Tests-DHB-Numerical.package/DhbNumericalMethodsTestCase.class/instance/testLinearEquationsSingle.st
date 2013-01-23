linear algebra
testLinearEquationsSingle

	| s sol |
	s := DhbLinearEquationSystem equations:
							#( (1 2 0) (3 5 4) (5 6 3)) constant: #(0.1 12.5 10.3).
	sol := s solution.
	self should: [ sol size = 3].
	self should: [ (sol at: 1) equalsTo: 0.5].
	self should: [ (sol at: 2) equalsTo: -0.2].
	self should: [ (sol at: 3) equalsTo:  3.0].