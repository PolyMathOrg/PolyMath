precision
testMachinePrecisionLargestNumberGreaterThanAnyFractionOfItself
	| mach |
	mach := DhbFloatingPointMachine new.
	self
		assert:
			mach largestNumber * (1 - mach defaultNumericalPrecision)
				< mach largestNumber