mathematical functions
arcTan: denominator 
	"Answer the  four quadrants arc tangent of receiver over denominator."

	^denominator isZero 
		ifTrue: 
			[self isZero 
				ifTrue: 
					["shouldn't it be an error ? ^DomainError signal: '0 arcTan: 0'"
					^self class real: 0 imaginary: 0]
				ifFalse: 
					[self class
						real: Float pi / (real copySignTo: 2)
						imaginary: 0]]
		ifFalse: 
			[| res |
			res := (self / denominator) arcTan.
			denominator real < 0 ifTrue: [res := res + Float pi].
			res real > Float pi 
				ifTrue: [res := res - (Float pi * 2)].
			res]