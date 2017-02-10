mathematical functions
sqrt
	"Return the square root of the receiver with a positive imaginary part."

	| u v |
	(imaginary = 0 and: [real >= 0])
		ifTrue:	[^self class real: real sqrt imaginary: 0].
	v := (self abs - real / 2) sqrt.
	u := imaginary / 2 / v.
	^self class real: u imaginary: v