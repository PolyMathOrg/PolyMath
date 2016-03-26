precision
testMachinePrecisionSmallNumberNotZero
	| mach |
	mach := DhbFloatingPointMachine new.
	self assert: mach smallNumber > 0.0