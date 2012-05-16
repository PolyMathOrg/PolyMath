converting
j
	"Answer the product of the receiver with pure imaginary j.
	This is the same as self * 1 j"


	^self species 
		qr: qj negated
		qi: qk negated
		qj: qr
		qk: qi