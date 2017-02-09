precision
testMachinePrecisionSmallestNumberNotZero
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach smallestNumber > 0.0