information
series: aNumber
	"Private"

	| term |
	term := aNumber.
	^ coefficients
		inject: 1.000000000190015
		into: [ :sum :each | 
			term := term + 1.
			each / term + sum ]