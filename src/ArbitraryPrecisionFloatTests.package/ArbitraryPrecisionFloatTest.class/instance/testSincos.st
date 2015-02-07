testing-trigonometry
testSincos
	<timeout: 30 "seconds">
	self trigonometricSerie do: [:aFloat |
		| x sc s c |
		x := aFloat asArbitraryPrecisionFloatNumBits: 53.
		sc := x sincos.
		s := x sin.
		c := x cos.
		self assert: sc size = 2.

		self assert: sc first = s.
		self assert: sc last = c]