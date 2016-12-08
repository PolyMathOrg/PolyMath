private
checkDoublePrecision: y forFunction: func nBits: n
	"Check that doubling the precision, then rounding would lead to the same result"
	
	| anArbitraryPrecisionFloat singlePrecisionResult |
	anArbitraryPrecisionFloat := y asArbitraryPrecisionFloatNumBits: n.
	singlePrecisionResult := anArbitraryPrecisionFloat perform: func.
	self checkThatEvaluatingFunction: func toDoublePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult.
	^singlePrecisionResult