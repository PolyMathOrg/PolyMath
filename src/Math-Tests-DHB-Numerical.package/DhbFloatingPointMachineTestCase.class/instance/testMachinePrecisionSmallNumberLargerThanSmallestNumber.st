precision
testMachinePrecisionSmallNumberLargerThanSmallestNumber
	| mach |
	mach := DhbFloatingPointMachine new.
	self assert: mach smallestNumber < mach smallNumber