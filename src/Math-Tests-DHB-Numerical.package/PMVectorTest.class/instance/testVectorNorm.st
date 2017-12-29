tests
testVectorNorm
	| v1 v2 |
	v1 := #(1 0) asPMVector.
	self assert: v1 norm equals: 1.
	v2 := #(0 1) asPMVector.
	self assert: v2 norm equals: 1.
	self shouldnt: [ (v1 + v2) norm = 1 ].
	"normalized norm may differ from exactly one due to floating point operations"
	self assert: ((v1 + v2) normalized norm equalsTo: 1)