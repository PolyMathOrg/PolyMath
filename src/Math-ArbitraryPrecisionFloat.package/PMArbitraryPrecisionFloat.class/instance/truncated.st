converting
truncated
	"answer the integer that is nearest to self in the interval between zero and self"
	
	^biasedExponent negated > self numBitsInMantissa 
		ifTrue: [0]
		ifFalse: [self shift: mantissa by: biasedExponent]