running
testFloatClass
	"not much to do here?"
	self should: [(1.5 * q1234) floatClass = 1.5 class].
	self should: [q12 floatClass = q12 reduce floatClass ].