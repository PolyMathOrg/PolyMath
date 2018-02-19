tests
testValueS
	"Comparing S to its known value"

	| s |
	s := matrix decompose sForm.
	self assert: s closeTo: actualS.