precision
testMachinePrecisionSmallNumberLargerThanSmallestNumber
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach smallestNumber < mach smallNumber