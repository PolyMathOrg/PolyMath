information
computeNegativeMachinePrecision
	
	| one zero floatingRadix inverseRadix tmp |
	one := 1.0.
	zero := 0.0.
	floatingRadix := self radix asFloat.
	inverseRadix := one / floatingRadix.
	negativeMachinePrecision := one.
	[ tmp := one - negativeMachinePrecision.
	  tmp - one = zero]
		whileFalse:[ negativeMachinePrecision := negativeMachinePrecision * inverseRadix].