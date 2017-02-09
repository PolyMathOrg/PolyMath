precision
testMachinePrecisionLargestNumberNotInfinity
	| mach |
	mach := PMFloatingPointMachine new.
	self assert: mach largestNumber < Float infinity