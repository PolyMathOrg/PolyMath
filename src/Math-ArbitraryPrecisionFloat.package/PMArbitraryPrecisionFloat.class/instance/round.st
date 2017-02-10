private
round
	"apply algorithm round to nearest even used by IEEE arithmetic"

	"inexact := ma lowBit <= excess."

	| excess ma carry |
	mantissa isZero
		ifTrue: [ 
			biasedExponent := 0.
			^ self ].
	ma := mantissa abs.
	excess := ma highBit - nBits.
	excess > 0
		ifFalse: [ ^ self ].
	carry := ma bitAt: excess.
	mantissa := self shift: mantissa by: excess negated.
	biasedExponent := biasedExponent + excess.
	(carry = 1 and: [ mantissa odd or: [ ma lowBit < excess ] ])
		ifFalse: [ ^ self ].
	mantissa := mantissa + mantissa sign.
	self truncate