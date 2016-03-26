precision
testMachinePrecisionLargestNumberNotInfinity
	| mach |
	mach := DhbFloatingPointMachine new.
	self assert: mach largestNumber < Float infinity