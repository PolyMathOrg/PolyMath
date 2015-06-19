private
multiplier: theta
^theta < (n // 4) ifTrue: [ 
	Complex 
		real: (sinTable at: sinTable size - theta) 
		imaginary: (sinTable at: theta + 1) ] ifFalse: [ 
	Complex 
		real: (sinTable at: theta - (n // 4) + 1) negated 
		imaginary: (sinTable at: n // 2 - theta + 1) ].