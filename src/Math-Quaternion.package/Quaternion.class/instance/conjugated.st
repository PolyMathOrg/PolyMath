arithmetic
conjugated
	"Return the conjugate of this quaternion number."

	^self species 
		qr: qr
		qi: qi negated
		qj: qj negated
		qk: qk negated