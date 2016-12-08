private
reduce
	"remove trailing zero bits from mantissa so that we can do arithmetic on smaller integer
	(that will un-normalize self)"

	| trailing |
	trailing := mantissa abs lowBit - 1.
	trailing > 0
		ifFalse: [ ^ self ].
	mantissa := self shift: mantissa by: trailing negated.
	biasedExponent := biasedExponent + trailing