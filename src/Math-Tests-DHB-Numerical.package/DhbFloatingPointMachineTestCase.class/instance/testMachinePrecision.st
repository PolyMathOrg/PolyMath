precision
testMachinePrecision
	| mach |
	mach := DhbFloatingPointMachine new.
	self assert: mach machinePrecision > 0.
	self assert: mach machinePrecision < 1.
	self assert: mach negativeMachinePrecision > 0.
	self assert: mach negativeMachinePrecision < 1.
	self
		assert: (mach radix raisedTo: mach negativeMachinePrecision)
		equals: 1.0.
	self assert: (mach radix raisedTo: mach machinePrecision) equals: 1.0