precision
testMachinePrecisionLargestNumberGreaterThanAnyFractionOfItself
	| mach |
	mach := PMFloatingPointMachine new.
	self
		assert:
			mach largestNumber * (1 - mach defaultNumericalPrecision)
				< mach largestNumber