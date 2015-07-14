information
variance
		"Answer the variance of the receiver.
		 Undefined if dof2 is smaller than 5.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^dof2 > 4 ifTrue: [ dof2 squared * 2 * ( dof1 + dof2 - 2) / ( ( dof2 - 2) squared * dof1 * ( dof2 - 4))]
				   ifFalse:[ nil]