tests
testAbsSecure
	"self run: #testAbsSecure"
	"using equalsTo since absSecure returns a slightly different Float"
	| c |
	c := (6 - 6 i).
	self should: [c absSecure  equalsTo: 72 sqrt].
	