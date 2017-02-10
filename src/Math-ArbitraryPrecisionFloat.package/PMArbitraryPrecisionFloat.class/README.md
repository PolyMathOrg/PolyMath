I store floating point numbers in base 2 with some arbitrary precision (arbitrary number of bits).
I do inexact arithmetic like Float.
But I am very slow due to emulated (Large) Integer arithmetic... (compared to IEEE 754 hardwired)

Unlike Float, mantissa is not normalized under the form 1.mmmmmm
It is just stored as an integer.
The sign is stored in the mantissa.
biasedExponent is the power of two that multiply the mantissa to form the number. there is no limitation of exponent (overflow or underflow), unless you succeed in exhausting the VM memory...

Like Float, my arithmetic operations are inexact. They will round to nearest nBits ArbitraryPrecisionFloat.

If two different precisions are used in arithmetic, the result is expressed in the higher precision.

Default operating mode is rounding, but might be one of the other possibility (truncate floor ceiling).

Instance Variables:
	biasedExponent	<Integer>	the times two power to multiply the mantissa (floating binary scale)
	mantissa	<Integer>	the bits of mantissa including sign
	nBits	<Magnitude>	number of bits to be stored in mantissa when i am normalized
