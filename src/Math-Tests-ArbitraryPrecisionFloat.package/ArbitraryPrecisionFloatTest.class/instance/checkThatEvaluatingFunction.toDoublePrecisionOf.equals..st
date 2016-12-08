private
checkThatEvaluatingFunction: func toDoublePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult
	"Check that doubling the precision, then rounding would lead to the same result"
	
	| n doublePrecision doublePrecisionResult lowBits |
	n := anArbitraryPrecisionFloat numBits.
	doublePrecision := anArbitraryPrecisionFloat asArbitraryPrecisionFloatNumBits: n * 2.
	doublePrecisionResult := doublePrecision perform: func.
	
	"Note: the test must be guarded against double rounding error condition.
	For example, suppose the single precision is 4 bits, double precision 8 bits.
	If exact result is 1.001 | 0111 | 1001...
	Then the nearest double is rounded to upper 1.001 | 1000
	Then the nearest single to the double is rounded to upper 1.010
	But the nearest single to the exact result should have been 1.001
	To avoid this, we have to check if the second rounding is an exact tie"
	doublePrecisionResult normalize.
	lowBits := doublePrecisionResult mantissa bitAnd: 1<<n-1.
	lowBits = (1<<(n-1))
		ifTrue:
			["double precision is ambiguous - retry with quadruple..."
			^self checkThatEvaluatingFunction: func toQuadruplePrecisionOf: anArbitraryPrecisionFloat equals: singlePrecisionResult].
	self assert: ((doublePrecisionResult asArbitraryPrecisionFloatNumBits: n)- singlePrecisionResult) isZero
	
