tests
testAdaptToCollectionAndSend
	"self run: #testAbsSecure"
	"using equalsTo since absSecure returns a slightly different Float"
	| c arr |
	c := (6 - 6 i).
	arr := #(0 1 2 3 4 5).
	self should: [(arr + c at: 1) = c ].
	self should: [(arr * c at: 2) = c].
		