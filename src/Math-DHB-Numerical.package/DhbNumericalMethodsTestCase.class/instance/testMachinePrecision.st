precision
testMachinePrecision
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach machinePrecision > 0].
self should: [mach machinePrecision < 1].
self should: [mach negativeMachinePrecision > 0].
self should: [mach negativeMachinePrecision < 1].
self should: [(mach radix raisedTo: mach negativeMachinePrecision) = 1.0].
self should: [(mach radix raisedTo: mach machinePrecision) = 1.0].