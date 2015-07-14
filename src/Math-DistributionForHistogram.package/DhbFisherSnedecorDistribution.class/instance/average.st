information
average
		"Answer the average of the receiver.
		 Undefined if dof2 is smaller than 3.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^dof2 > 2
		ifTrue: [ dof2 / ( dof2 - 2)]
		ifFalse:[ nil]