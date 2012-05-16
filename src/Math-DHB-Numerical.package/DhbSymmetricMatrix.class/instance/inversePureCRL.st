operation
inversePureCRL
		"Answer the inverse of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| matrices b1 cb1 cb1ct |
	rows size = 1
		ifTrue: [ ^self inverse1By1].
	rows size = 2
		ifTrue: [ ^self inverse2By2].
	matrices := self split.
	b1 := ( matrices at: 1) inversePureCRL.
	cb1 := ( matrices at: 3) * b1.
	cb1ct := ( cb1 productWithTransposeMatrix: ( matrices at: 3)) asSymmetricMatrix.
	matrices at: 2 put: ( ( matrices at: 2) accumulateNegated: cb1ct) inversePureCRL.
	matrices at: 3 put: ( matrices at: 2) * cb1.
	matrices at: 1 put: ( b1 accumulate: ( cb1 transposeProductWithMatrix: ( matrices at: 3))).
	( matrices at: 3) negate.
	^self class join: matrices