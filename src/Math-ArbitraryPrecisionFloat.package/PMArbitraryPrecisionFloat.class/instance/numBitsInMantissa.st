accessing
numBitsInMantissa
	"this is equal to nBits only if we are normalized.
	If we are reduced (low bits being zero are removed), then it will be less.
	If we haven't been rounded/truncated then it will be more"

	^mantissa highBitOfMagnitude