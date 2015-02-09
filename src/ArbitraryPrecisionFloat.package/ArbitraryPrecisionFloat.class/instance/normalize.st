private
normalize
	"normalize the receiver.
	a normalized floating point is either 0, or has mantissa highBit = nBits"
	
	| delta |
	mantissa isZero
		ifTrue: [biasedExponent := 0]
		ifFalse: 
			[self round.
			delta := self numBitsInMantissa - nBits.
			delta < 0 
				ifTrue: 
					[mantissa := self shift: mantissa by: delta negated.
					biasedExponent := biasedExponent + delta]]