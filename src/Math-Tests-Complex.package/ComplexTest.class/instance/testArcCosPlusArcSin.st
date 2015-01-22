tests
testArcCosPlusArcSin
	| c |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:real |
	#(-0.5 -2 -3 0 0.5 2 3) do: [:imag |
		c := real + imag i.
		self assert: ((c arcCos + c arcSin) real closeTo: Float halfPi).
		self assert: ((c arcCos + c arcSin) imaginary closeTo: 0.0)]]