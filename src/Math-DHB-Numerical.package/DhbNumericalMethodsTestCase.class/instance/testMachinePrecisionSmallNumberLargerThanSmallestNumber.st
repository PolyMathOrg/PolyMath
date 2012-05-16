precision
testMachinePrecisionSmallNumberLargerThanSmallestNumber
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach smallestNumber < mach smallNumber].