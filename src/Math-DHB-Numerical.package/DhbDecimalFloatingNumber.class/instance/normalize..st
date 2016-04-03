transformation
normalize: aNumber
	"Private"

	exponent := (self class digits - (aNumber log: 10)) floor.
	mantissa := (aNumber * (10 raisedToInteger: exponent)) truncated.
	^ self