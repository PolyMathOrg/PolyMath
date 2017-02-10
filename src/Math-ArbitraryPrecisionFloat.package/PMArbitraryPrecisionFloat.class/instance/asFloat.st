converting
asFloat
	"Convert to a IEEE 754 double precision floating point."
	
	nBits > Float precision ifTrue: [^(self copy setPrecisionTo: Float precision) asFloat].
	^mantissa asFloat timesTwoPower: biasedExponent