converting
reduce
	"Answer the receiver transformed to a lower generality, if
	such a transformation is possible without losing information.
	If not, answer the receiver"
	^(qj isZero and: [qk isZero])
		ifFalse: [self]
		ifTrue: [qi isZero
			ifTrue: [qr]
			ifFalse: [qr i: qi]]