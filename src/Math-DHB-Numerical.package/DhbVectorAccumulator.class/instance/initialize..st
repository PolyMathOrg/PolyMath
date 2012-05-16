initialization
initialize: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	average := DhbVector new: anInteger.
	self reset.
	^self