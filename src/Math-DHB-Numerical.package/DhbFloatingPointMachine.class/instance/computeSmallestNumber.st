information
computeSmallestNumber
	"Private - 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 11/6/99"

	| one floatingRadix inverseRadix fullMantissaNumber |
	one := 1 asFloat.
	floatingRadix := self radix asFloat.
	inverseRadix := one / floatingRadix.
	fullMantissaNumber := one - (floatingRadix * self negativeMachinePrecision).
	smallestNumber := fullMantissaNumber.
	[[fullMantissaNumber := fullMantissaNumber * inverseRadix.
	fullMantissaNumber = 0.0 ifTrue: [Error raise].
	smallestNumber := fullMantissaNumber.
	true]
		whileTrue: []]
		on: Error do: [:signal | signal return: nil]