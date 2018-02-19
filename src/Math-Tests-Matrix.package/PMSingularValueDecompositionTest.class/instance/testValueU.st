tests
testValueU
	"Comparing U to its known value"

	| u |
	u := matrix decompose leftSingularForm.
	self assert: u closeTo: actualU.