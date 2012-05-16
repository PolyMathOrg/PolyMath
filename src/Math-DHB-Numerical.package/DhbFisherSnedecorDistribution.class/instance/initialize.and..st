initialization
initialize: anInteger1 and: anInteger2
		"Private - Initialize the parameters of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	dof1 := anInteger1.
	dof2 := anInteger2.
	self computeNorm.
	^self