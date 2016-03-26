tests
testCopy
	"a separate copy method is necessary because of this scenario"

	| a b |
	a := NNStore withAll: #(1 2 4).
	b := a copy.
	self assert: b equals: a.
	self assert: b hash equals: a hash.
	b sortFor: nil.
	self deny: b = a.	"here is the problem"
	self deny: b hash = a hash