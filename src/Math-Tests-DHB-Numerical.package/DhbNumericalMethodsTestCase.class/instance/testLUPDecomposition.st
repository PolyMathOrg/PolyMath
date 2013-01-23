linear algebra
testLUPDecomposition
	"Code Example 8.10"
	| s sol1 sol2 |
	s := DhbLUPDecomposition equations:
							#( (3 2 4) (2 -5 -1) ( 1 -2 2)).
	sol1 := s solve: #(16 6 10).
	sol2 := s solve: #(7 10 9).
	self should: [ sol1 size = 3].
	self should: [ (sol1 at: 1) = 2].
	self should: [ (sol1 at: 2) = -1].
	self should: [ (sol1 at: 3) = 3].
	self should: [ sol2 size = 3].
	self should: [ (sol2 at: 1) = 1].
	self should: [ (sol2 at: 2) = -2].
	self should: [ (sol2 at: 3) = 2].