transformation
accumulateNegated: aVectorOrAnArray
	"Modify the receiver adding the negated contents of the argument to the receiver."
	1 to: self size do: [ :n | self at: n put: ((self at: n) - (aVectorOrAnArray at: n))].