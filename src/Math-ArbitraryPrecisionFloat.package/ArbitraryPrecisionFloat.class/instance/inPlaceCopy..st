private
inPlaceCopy: b 
	"copy another arbitrary precision float into self"

	mantissa := b mantissa.
	biasedExponent := b biasedExponent.
	nBits := b numBits