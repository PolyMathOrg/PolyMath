tests
testAdaptToCollectionAndSend
	"self run: #testAbsSecure"

	"using equalsTo since absSecure returns a slightly different Float"

	| c arr |
	c := 6 - 6 i.
	arr := #(0 1 2 3 4 5).
	self assert: (arr + c at: 1) equals: c.
	self assert: (arr * c at: 2) equals: c