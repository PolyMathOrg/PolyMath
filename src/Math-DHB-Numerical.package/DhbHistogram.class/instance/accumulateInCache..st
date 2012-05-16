transformation
accumulateInCache: aNumber
		"Private - Accumulate aNumber inside a cache
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	contents add: aNumber.
	contents size > cacheSize
		ifTrue: [ self flushCache].