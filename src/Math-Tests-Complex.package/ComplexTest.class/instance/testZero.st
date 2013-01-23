tests
testZero
	| z |
	z := Complex zero.
	self assert: z isZero.
	self assert: z isComplex.
	self assert: z real isZero.
	self assert: z imaginary isZero.