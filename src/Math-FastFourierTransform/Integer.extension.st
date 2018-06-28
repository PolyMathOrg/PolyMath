Extension { #name : #Integer }

{ #category : #'*Math-FastFourierTransform' }
Integer >> bitReverse: highBit [
	"Reverse the bits of the receiver so that the lsb is the highBit'th bit of the answer."

	| v r s |
	highBit < self highBit
		ifTrue: [ self error: 'Not enough bits.' ].
	v := self.
	r := v bitAnd: 1.
	s := highBit - 1.
	[ v := v bitShift: -1.
	v = 0 ]
		whileFalse: [ r := r bitShift: 1.
			r := r bitOr: (v bitAnd: 1).
			s := s - 1 ].
	^ r bitShift: s
]
