tests
testIsExampleCorrect
	"Verifying that the example SVD is correct"

	| reconstructed |
	reconstructed := actualU * actualS * actualV transpose.
	self assert: reconstructed closeTo: matrix.