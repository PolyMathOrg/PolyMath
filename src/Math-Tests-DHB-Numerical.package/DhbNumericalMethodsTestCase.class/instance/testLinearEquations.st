linear algebra
testLinearEquations
	"Code Example 8.6"
	| s sol1 sol2 |
	s := DhbLinearEquationSystem equations:
							#( (3 2 4) (2 -5 -1) ( 1 -2 2))
				constants: #( (16 6 10)
									  (7 10 9)).
	sol1 := s solutionAt: 1.
	sol2 := s solutionAt: 2.
	self should: [ sol1 size = 3].
	self should: [ (sol1 at: 1) = 2].
	self should: [ (sol1 at: 2) = -1].
	self should: [ (sol1 at: 3) = 3].
	self should: [ sol2 size = 3].
	self should: [ (sol2 at: 1) = 1].
	self should: [ (sol2 at: 2) = -2].
	self should: [ (sol2 at: 3) = 2].