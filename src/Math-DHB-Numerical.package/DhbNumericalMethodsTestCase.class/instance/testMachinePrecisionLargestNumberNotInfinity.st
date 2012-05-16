precision
testMachinePrecisionLargestNumberNotInfinity
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach largestNumber < Float infinity].