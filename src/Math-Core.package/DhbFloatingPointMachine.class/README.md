A DhbFloatingPointMachine represents the numerical precision of this system.

Instance Variables

	defaultNumericalPrecision:		The relative 
numerical precision that can be expected for a general numerical computation. One should consider to numbers a and b equal if the relative difference between them is less than the default machine precision.

	largestExponentArgument:		natural logarithm of largest number

	largestNumber:		The largest positive number that can be represented in the machine

	machinePrecision:		r^{-(n+1)}, with the largest n such that (1 + r^-n) - 1 != 0

	negativeMachinePrecision:		r^{-(n+1)}, with the largest n such that (1 - r^-n) - 1 != 0

	radix:		The radix of the floating point representation. This is often 2.

	smallNumber:		A number that can be added to some value without noticeably changing the result of the computation

	smallestNumber:		The smallest positive number different from 0.


largestExponentArgument
	- xxxxx

This class is detailed in Object Oriented Implementation of Numerical Methods, Section 1.4.1 and 1.4.2.

(c) Copyrights Didier BESSET, 1999.
