private
checkThatEvaluatingFunction: func toQuadruplePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult
	"Check that quadrupling the precision, then rounding would lead to the same result"
	
	| n quadruplePrecision quadruplePrecisionResult lowBits |
	n := anArbitraryPrecisionFloat numBits.
	quadruplePrecision := anArbitraryPrecisionFloat asArbitraryPrecisionFloatNumBits: n * 4.
	quadruplePrecisionResult := quadruplePrecision perform: func.
	
	"Guard against double rounding error condition (exact tie)"
	quadruplePrecisionResult normalize.
	lowBits := quadruplePrecisionResult mantissa bitAnd: 1<<(3*n)-1.
	lowBits = (1<<(3*n-1))
		ifTrue:
			["quadruple precision is ambiguous - give up..."
			^self].
	self assert: ((quadruplePrecisionResult asArbitraryPrecisionFloatNumBits: n)- singlePrecisionResult) isZero.