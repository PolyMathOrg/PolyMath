tests
testValueV
	"Comparing V to its known value"

	| v |
	v := matrix decompose rightSingularForm.
	self assert: v closeTo: actualV.