precision
testUniqueInstance
| mach1 mach2 mach3 |
mach1 := DhbFloatingPointMachine new.
mach2 := DhbFloatingPointMachine new.
self should: [mach1 == mach2].
DhbFloatingPointMachine reset.
mach3 := DhbFloatingPointMachine new.
self shouldnt: [mach3 == mach2].
