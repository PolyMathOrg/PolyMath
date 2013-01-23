precision
testMachinePrecisionLargestNumberIsLargest
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach largestNumber * (1 + mach defaultNumericalPrecision) = Float infinity].
