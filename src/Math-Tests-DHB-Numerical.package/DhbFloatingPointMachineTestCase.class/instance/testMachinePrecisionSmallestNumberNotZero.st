precision
testMachinePrecisionSmallestNumberNotZero
	| mach |
	mach := DhbFloatingPointMachine new.
	self assert: mach smallestNumber > 0.0