converting
k
	"Answer the product of the receiver with pure imaginary k.
	This is the same as self * 1 k"


	^self species 
		qr: qk negated
		qi: qj
		qj: qi negated
		qk: qr