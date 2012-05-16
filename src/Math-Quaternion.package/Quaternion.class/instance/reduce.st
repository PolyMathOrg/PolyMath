converting
reduce
	"Answer the receiver transformed to a lower generality, if
	such a transformation is possible without losing information.
	If not,answer the receiver"
	^ self unreal isZero
		ifTrue: [qr reduce]
		ifFalse: [(qj isZero
					and: [qk isZero])
				ifTrue: [qr i: qi]
				ifFalse: [self]]