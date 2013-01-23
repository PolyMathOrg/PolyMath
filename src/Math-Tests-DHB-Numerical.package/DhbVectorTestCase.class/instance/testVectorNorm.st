information
testVectorNorm
	| v1 v2 |
	v1 := #(1 0) asVector.
	self should: [v1 norm = 1].
	v2 := #(0 1) asVector.
	self should: [v2 norm = 1].
	self shouldnt: [(v1 + v2) norm = 1].
	"normalized norm may differ from exactly one due to floating point operations"
	self should: [(v1 + v2) normalized norm equalsTo:  1].