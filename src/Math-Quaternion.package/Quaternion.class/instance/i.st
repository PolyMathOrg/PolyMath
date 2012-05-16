converting
i
	"Answer the product of the receiver with pure imaginary i.
	This is the same as self * 1 i"

	^self species 
		qr: qi negated
		qi: qr
		qj: qk
		qk: qj negated