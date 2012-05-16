information
maximum
		"Answer the minimum for the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	self isCached
		ifTrue: [ self flushCache].
	^contents size * binWidth + minimum