operation
crlInverse
	"corrected sequence of calcs; s1in matrices at:2 has to be calced first (split returns matrices in this order: b, d, c).
and taken care of degenerate cases (which is unnecessary, if this method is not called outside of inverse)"
	| matrices b1 cb1ct cb1 |
	rows size = 1
		ifTrue: [ ^self inverse1By1].
	rows size = 2
		ifTrue: [ ^self inverse2By2].
	matrices := self split.
	b1 := (matrices at: 1) inverse.
	cb1 := (matrices at: 3) * b1.
	cb1ct := (cb1 productWithTransposeMatrix: (matrices at: 3))asSymmetricMatrix .
	matrices at: 2 put: ((matrices at: 2) - cb1ct ) inverse.
	matrices at: 3 put: (matrices at: 2) * cb1.
	matrices at: 1 put: ( b1 + (cb1 transposeProductWithMatrix: (matrices at: 3))asSymmetricMatrix).
	(matrices at: 3) negate.
	^ self class join: matrices