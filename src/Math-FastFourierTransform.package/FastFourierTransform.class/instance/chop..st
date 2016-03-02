accessing
chop: tolerance
	"sets numbers smaller than tolerance to zero"

	| r i | 
	^ data := data
		collect:
			[ :k | 
			r := k real.
			i := k imaginary.
			r abs < tolerance
				ifTrue: [ r := 0 ].
			i abs < tolerance
				ifTrue: [ i := 0 ].
			Complex real: r imaginary: i ]