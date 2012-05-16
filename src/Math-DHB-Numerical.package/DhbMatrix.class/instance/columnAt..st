information
columnAt: anInteger
		"Answers the anInteger-th column of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^rows collect: [ :each | each at: anInteger]