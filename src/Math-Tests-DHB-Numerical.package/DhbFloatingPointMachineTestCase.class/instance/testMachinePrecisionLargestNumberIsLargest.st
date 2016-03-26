precision
testMachinePrecisionLargestNumberIsLargest
	| mach |
	mach := DhbFloatingPointMachine new.
	self
		assert: mach largestNumber * (1 + mach defaultNumericalPrecision)
		equals: Float infinity