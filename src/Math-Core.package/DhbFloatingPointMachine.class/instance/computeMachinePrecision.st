information
computeMachinePrecision
	
	| one zero inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	inverseRadix := one / self radix asFloat.
	machinePrecision := one.
	[ tmp := one + machinePrecision.
	  tmp - one = zero]
		whileFalse:[  machinePrecision := machinePrecision * inverseRadix].