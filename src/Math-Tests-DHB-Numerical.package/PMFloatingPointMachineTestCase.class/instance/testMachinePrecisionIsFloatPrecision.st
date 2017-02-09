precision
testMachinePrecisionIsFloatPrecision
	"sanity check. Take logs to find the exponent, then compare to Float's method"

	| prec |
	prec := (PMFloatingPointMachine new machinePrecision ln
		/ PMFloatingPointMachine new radix ln) negated.
	self assert: prec equals: Float precision