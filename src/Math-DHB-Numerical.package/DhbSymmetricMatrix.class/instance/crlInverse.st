operation
crlInverse
	| matrices b1 cb1ct cb1 |
	matrices := self split.
	b1 := (matrices at: 1) inverse.
	cb1 := (matrices at: 3) * b1.
	cb1ct := (cb1 productWithTransposeMatrix: (matrices at: 3)) 
				asSymmetricMatrix.
	matrices at: 3 put: (matrices at: 2) * cb1.
	matrices at: 2 put: ((matrices at: 2) accumulateNegated: cb1ct) inverse.
	matrices at: 1 put: ( b1 accumulate: (cb1 transposeProductWithMatrix: (matrices at: 3))).
	(matrices at: 3) negate.
	^self class join: matrices