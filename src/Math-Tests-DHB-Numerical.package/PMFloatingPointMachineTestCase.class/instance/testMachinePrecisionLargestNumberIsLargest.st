precision
testMachinePrecisionLargestNumberIsLargest
	| mach |
	mach := PMFloatingPointMachine new.
	self
		assert: mach largestNumber * (1 + mach defaultNumericalPrecision)
		equals: Float infinity