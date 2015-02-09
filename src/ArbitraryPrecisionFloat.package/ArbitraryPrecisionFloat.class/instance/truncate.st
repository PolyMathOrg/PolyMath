private
truncate
	"remove trailing bits if they exceed our allocated number of bits"

	| excess |
	excess := self numBitsInMantissa - nBits.
	excess > 0
		ifFalse: [ ^ self ].
	mantissa := self shift: mantissa by: excess negated.
	biasedExponent := biasedExponent + excess