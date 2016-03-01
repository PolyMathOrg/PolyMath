information
computeSmallestNumber
	
	| one floatingRadix inverseRadix fullMantissaNumber |
	one := 1 asFloat.
	floatingRadix := self radix asFloat.
	inverseRadix := one / floatingRadix.
	fullMantissaNumber := one - (floatingRadix * self negativeMachinePrecision).
	smallestNumber := fullMantissaNumber.
	[[fullMantissaNumber := fullMantissaNumber * inverseRadix.
	fullMantissaNumber = 0.0 ifTrue: [Error signal ].
	smallestNumber := fullMantissaNumber.
	true]
		whileTrue: []]
		on: Error do: [:signal | signal return: nil]