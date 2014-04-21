accessing
next
	"Answer a Float in interval [0.0,1.0) with uniform distribution.
	Note that constant 16rFFFFF800 is computed so as to truncate the 64 bits to Float precision.
	It is thus ((1 << 32 - 1 << (64 - Float precision) bitAnd: 1 << 32 - 1)) hex"
	^(kernelRand1 next asFloat timesTwoPower: -32)
		+ ((kernelRand2 next bitAnd: 16rFFFFF800) asFloat timesTwoPower: -64)