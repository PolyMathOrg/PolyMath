precision
testMachinePrecisionLargestNumberGreaterThanAnyFractionOfItself
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach largestNumber * (1 - mach defaultNumericalPrecision) < mach largestNumber].
