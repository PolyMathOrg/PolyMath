precision
testUniqueInstance
	| mach1 mach2 mach3 |
	mach1 := PMFloatingPointMachine new.
	mach2 := PMFloatingPointMachine new.
	self assert: mach1 == mach2.
	PMFloatingPointMachine reset.
	mach3 := PMFloatingPointMachine new.
	self shouldnt: [ mach3 == mach2 ]