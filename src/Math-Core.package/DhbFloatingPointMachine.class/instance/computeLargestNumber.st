information
computeLargestNumber

	| one floatingRadix fullMantissaNumber |
	one := 1.0.
	floatingRadix := self radix asFloat.
	fullMantissaNumber := one - ( floatingRadix * self negativeMachinePrecision).
	largestNumber := fullMantissaNumber.
	[ [ fullMantissaNumber := fullMantissaNumber * floatingRadix.
	    fullMantissaNumber isInfinite ifTrue: [^nil].
	    largestNumber := fullMantissaNumber.
		true] whileTrue: [ ].
		] on: Error do: [ :signal | signal return: nil].