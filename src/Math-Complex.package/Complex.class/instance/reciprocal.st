arithmetic
reciprocal
	"Answer 1 divided by the receiver. Create an error notification if the 
	receiver is 0."

	self = 0
		ifTrue: [^ (ZeroDivide dividend: self) signal]
		ifFalse: [^1 / self]
		