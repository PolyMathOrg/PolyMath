precision
testMachinePrecisionSmallNumberNotZero
| mach |
mach := DhbFloatingPointMachine new.
self should: [mach smallNumber > 0.0].