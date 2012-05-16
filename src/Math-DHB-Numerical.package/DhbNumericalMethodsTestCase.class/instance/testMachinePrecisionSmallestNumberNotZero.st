precision
testMachinePrecisionSmallestNumberNotZero
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach smallestNumber > 0.0].