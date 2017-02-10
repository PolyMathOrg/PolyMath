private
multiplier: theta
	^ theta < (n // 4)
		ifTrue:
			[ PMComplex real: (sinTable at: sinTable size - theta) imaginary: (sinTable at: theta + 1) ]
		ifFalse:
			[ PMComplex
				real: (sinTable at: theta - (n // 4) + 1) negated
				imaginary: (sinTable at: n // 2 - theta + 1) ]