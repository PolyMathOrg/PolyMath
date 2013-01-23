linear algebra
testMatrixDo
	| a |
	a := DhbMatrix rows: #((1 2 3) ( 1 2 3) (1 2 3)).
	a rowsDo: [:row | row at: 1 put: 0].
	self should: [(a at: 1 at: 1) = 0].
	a columnsDo: [:col | a atRow: 1 put: col].
	self should: [(a rowAt: 1) = (#(2 3 3) asVector)].
