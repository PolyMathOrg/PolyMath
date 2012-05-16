information
computeMachinePrecision
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 21/4/99 "
	| one zero inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	inverseRadix := one / self radix asFloat.
	machinePrecision := one.
	[ tmp := one + machinePrecision.
	  tmp - one = zero]
		whileFalse:[  machinePrecision := machinePrecision * inverseRadix].