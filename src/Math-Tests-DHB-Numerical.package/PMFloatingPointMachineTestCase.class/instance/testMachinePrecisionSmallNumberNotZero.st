precision
testMachinePrecisionSmallNumberNotZero
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach smallNumber > 0.0